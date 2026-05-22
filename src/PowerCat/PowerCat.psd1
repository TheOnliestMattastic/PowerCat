@{
    # Script module or binary module file associated with this manifest
    RootModule        = 'PowerCat.psm1'

    # Version number of this module
    ModuleVersion     = '3.0.0'

    # Supported PSEditions
    CompatiblePSEditions = @('Desktop','Core')

    # ID used to uniquely identify this module
    GUID              = '4393a30b-14ea-4597-bfd3-dcabd3f3acc9'  # Use New-Guid

    # Author of this module
    Author            = 'The Onliest Mattastic'

    # Company or vendor of this module
    CompanyName       = 'The Onliest Mattastic'

    # Copyright statement
    Copyright         = '(c) 2025 The Onliest Mattastic. All rights reserved.'

    # Description of the functionality provided by this module
    Description       = 'PowerCat is a single-shot concatenator that bundles markdown and code files into one text file. Outputs to stdout (Unix cat-style) or file. Supports recursion, Markdown fencing, custom extensions, sorting, minification, and token estimation for AI context planning.'

    # Minimum version of the PowerShell engine required
    PowerShellVersion = '5.1'

    # Functions to export from this module
    FunctionsToExport = @('Invoke-PowerCat')

    # Cmdlets to export from this module
    CmdletsToExport   = @()

    # Variables to export from this module
    VariablesToExport = @()

    # Aliases to export from this module
    AliasesToExport   = @('PowerCat','pcat','concat')

    # Private data to pass to the module
    PrivateData       = @{

        PSData = @{

            # Tags applied to this module for discovery
            Tags = @('Concatenate','Utility','Markdown','DevTools','PowerShell','CodeBundler','Textfile','Documentation','LLM','TokenCounter','AIContext')

            # A URL to the license for this module
            LicenseUri = 'https://opensource.org/licenses/MIT'

            # A URL to the main website for this project
            ProjectUri = 'https://github.com/TheOnliestMattastic/PowerCat'

            # A URL to an icon representing this module
            IconUri = 'https://raw.githubusercontent.com/PowerShell/PowerShell/master/assets/ps_black_64.svg'

        }
    }
}
