Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFFA606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 20:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Nzq8auP;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CKQpNjIe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tTL/AUEqSJkRG3nWH8R3uR4syPVF5VUWiQzwcpGtoTI=; b=2Nzq8auPMrJQPt4BPWBREsZuAU
	dkZ1LgxpLAihhfBLqjLxQtqWWibDS8X6T9kCkO0mqudhq54BhSQhX+d/ns3rvB3b04AdOe4b+JyxS
	/lwHA3GWuYEx8z9a4/z5pgVJlZDLUjUPdGa9pRE0hLc2ndj1ZOaqTbKUcBdpUGpXljqbdVjTF8ELn
	H+wRuxbEjIWotKZjqd0TtJfaHmoKZAMtSQzwCJWoiTbzi4CEHIldpF34K6KJfx6x11exktvNvg1x0
	hyMl3fCFnGHCUK/E8JXqDG+paYJhLmJwps++yxdrJVbuuZ2la8agbcdjuvrM3QR8BdaVrtDXLclD0
	XS5MUbrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPie-000000070Dq-3RIe;
	Tue, 17 Nov 2026 20:23:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPic-000000070D6-0Vfa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 20:23:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05434339;
	Tue, 17 Nov 2026 12:23:50 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0358C3F632;
	Tue, 17 Nov 2026 12:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794947032; bh=aRKRMs6N0PcFLX51B23/Z9noAreEFY3ilqOZ6juqKJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKQpNjIeKDKrZSWQiWGaCvz9OSOzjj76EwUxedpIrMeoTSYxRTaIa+uS/pv/zfhz0
	 SyEssw5+WJFIycPzE2Lgc4Y9TIW8Y8+iDqkbAERpFeZ+xaZ4UtQZ9jJLFj2Bl59duc
	 LIZlBV4+wOyLC32RNt9QuaOD6evuZPoW18/x5Ed8=
Date: Tue, 17 Nov 2026 20:23:48 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>, apais@microsoft.com,
	rachelmenge@linux.microsoft.com, hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] tpm: tpm_crb_ffa: Only probe when ACPI TPM2 uses
 FF-A
Message-ID: <avy31EaCx3IQY_Ou@e129823.arm.com>
References: <20261115013456.212141-1-sidchintamaneni@gmail.com>
 <20261115013456.212141-3-sidchintamaneni@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115013456.212141-3-sidchintamaneni@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_122354_255214_A85BCFBC 
X-CRM114-Status: GOOD (  23.97  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LGTM.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Sun, Nov 15, 2026 at 01:34:54AM +0000, Siddharth Chintamaneni wrote:
> Prior to commit 677042afb97a ("tpm: tpm_crb_ffa: revert defered_probed
> when tpm_crb_ffa is built-in"), built-in tpm_crb_ffa only registered
> tpm_crb_ffa_driver from tpm_crb_ffa_init() after crb_acpi_probe()
> confirmed start_method == ACPI_TPM2_CRB_WITH_ARM_FFA. After that
> commit, tpm_crb_ffa unconditionally registers on the FF-A bus at
> device_initcall time (and when loaded as a module) without checking
> the platform's ACPI TPM2 start method.
> 
> A platform's firmware may expose a TPM CRB over FF-A Secure Partition
> for UEFI boot services while advertising a non-FF-A start method to
> the OS in the ACPI TPM2 table. When the ACPI TPM2 table designates a
> non-FF-A start method, Linux has no consumer for tpm_crb_ffa and
> should not probe the FF-A TPM service.
> 
> On Microsoft Cobalt 200 systems, the ACPI TPM2 table does not use
> ACPI_TPM2_CRB_WITH_ARM_FFA, yet ffa_init() discovers the FF-A TPM
> partition and tpm_crb_ffa_probe() unconditionally sends
> CRB_FFA_GET_INTERFACE_VERSION via FFA_MSG_SEND_DIRECT_REQ2/REQ SMC.
> That request wedges the calling CPU in Secure World (with Non-Secure
> interrupts and GICv3 pseudo-NMIs masked), hanging boot with an RCU CPU
> stall:
> 
>   [    5.507519] ARM FF-A: Driver version 1.2
>   [    5.507519] ARM FF-A: Firmware version 1.2 found
>   [    5.507551] ARM FF-A: Notification setup failed -61, not enabled
>   [    7.150580] Freeing initrd memory: 293640K
>   [   65.515248] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
>   [   65.521346] rcu:     10-...0: (3 GPs behind) idle=dd9c/1/0x4000000000000000 softirq=37/37 fqs=5262
>   [   65.530031] rcu:              hardirqs   softirqs   csw/system
>   [   65.535589] rcu:      number:        0          0            0
>   [   65.541146] rcu:     cputime:        0          0            0   ==> 30028(ms)
>   [   65.548102] rcu:     (detected by 66, t=15010 jiffies, g=-951, q=1384 ncpus=132)
>   [   65.555228] Sending NMI from CPU 66 to CPUs 10:
>   [   75.560686] After 10 seconds, these CPUS still haven't responded to the NMI: 10
> 
> Check tpm2_acpi_start_method in tpm_crb_ffa_probe() and return -ENODEV
> unless it equals ACPI_TPM2_CRB_WITH_ARM_FFA. Checking in probe() rather
> than module_init allows tpm_crb_ffa.ko to load as a symbol dependency
> of tpm_crb.ko on non-FF-A platforms when built as modules, while
> skipping FF-A TPM requests unless ACPI advertises the FF-A start
> method.
> 
> Fixes: eb93f0734ef1 ("tpm_crb: ffa_tpm: Implement driver compliant to CRB over FF-A")
> Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> ---
>  drivers/char/tpm/tpm_crb_ffa.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/char/tpm/tpm_crb_ffa.c b/drivers/char/tpm/tpm_crb_ffa.c
> index 025c4d4b17ca..da676da6f3f0 100644
> --- a/drivers/char/tpm/tpm_crb_ffa.c
> +++ b/drivers/char/tpm/tpm_crb_ffa.c
> @@ -9,9 +9,11 @@
>  
>  #define pr_fmt(fmt) "CRB_FFA: " fmt
>  
> +#include <linux/acpi.h>
>  #include <linux/arm_ffa.h>
>  #include <linux/delay.h>
>  #include <linux/moduleparam.h>
> +#include "tpm.h"
>  #include "tpm_crb_ffa.h"
>  
>  static unsigned int busy_timeout_ms = 2000;
> @@ -324,6 +326,9 @@ static int tpm_crb_ffa_probe(struct ffa_device *ffa_dev)
>  	struct tpm_crb_ffa *p;
>  	int rc;
>  
> +	if (tpm2_acpi_start_method != ACPI_TPM2_CRB_WITH_ARM_FFA)
> +		return -ENODEV;
> +
>  	/* only one instance of a TPM partition is supported */
>  	if (tpm_crb_ffa && !IS_ERR_VALUE(tpm_crb_ffa))
>  		return -EEXIST;
> -- 
> 2.45.4
> 

-- 
Sincerely,
Yeoreum Yun

