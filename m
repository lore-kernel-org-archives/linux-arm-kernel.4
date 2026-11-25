Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB211606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ek/kvw2y;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KUp8PjMC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aVLTDwFYWlqCWizPHhyCpymH+pYWjeFCqRXH0aPZ1ds=; b=ek/kvw2y5ehzyF
	uKsIR2WWBAlKWcQiJ4YhfeSr9YRhf9TAYxrhk7L08rmDIFOuC4Xge9N5TlMCrJeBapicfQTGTSUkr
	XBVeYHGaYKWmHv4l4Dmx7XyRj/6NDz0oCAf2vMb3Bapl5tR0hxOph1tq2Qu73Oc07yCyBNOiFgMSc
	0EFUZ3BDM0+2hZD5Og9LAljebNK+IBbxeuHsPOrbL34ns3L8Bkqem622YJQZ6m54LJ6Zuj4WbrMV3
	uFbI56zwzOrSvk4KVIvhYn7D6rLbP720aErDSzx5J1jgS0IdHZgYLNcKpa+E/BhEjLEZ+ssAnVt7H
	DR/jeLkDASr5JwG8sChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCnw-00000009wwk-3lQC;
	Wed, 25 Nov 2026 13:12:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCnN-00000009wcs-16pD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:12:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E24C2F;
	Wed, 25 Nov 2026 05:12:16 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C8183F86F;
	Wed, 25 Nov 2026 05:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795612339; bh=mW1ACO0Drqr0fPnzZSDbL9SOfYPnPyiIuS9DX+azukI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KUp8PjMCDPoQxQ62nO0fBsjF0DPNeoGM0+ahMPpMfct/8y0r0+q4zzUubji9QLlOm
	 s0Bi8L9qbYi/ZMEcxVeXvWkTpd/pD2Xu5eaSs4qtfvgHF74Wuy92CIik8TtW87WSIr
	 c3jrU5gyQImjU8wUsxwaTYBeYfUc3MGtrtdNZJhs=
Message-ID: <2f02f0b1-73b0-48ef-995a-b844bacefac2@arm.com>
Date: Wed, 25 Nov 2026 13:12:16 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ARM: NOMMU: pmsa-v7: Do not probe the region order on
 M-class
To: Brad Hawthorne <brad@sim.vu>, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261125025757.1159931-1-brad@sim.vu>
 <20261125025757.1159931-2-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261125025757.1159931-2-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_051221_614320_C2EA8591 
X-CRM114-Status: GOOD (  30.03  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/25/26 02:57, Brad Hawthorne wrote:
> __mpu_min_region_order() finds the minimum region size by writing
> 0xFFFFFFFC to the region base register and reading it back. That
> works on R-class, where the low bits are reserved. On M-class,
> MPU_RBAR bits [4:0] are VALID and REGION, so the write selects region
> 12, which an MPU with fewer than 13 regions does not have. QEMU
> (mps2-an385, 8 regions) logs "MPU region out of range 12/8", the
> read-back is 0, every RAM region fails, and the kernel panics:
> 
>   Kernel panic - not syncing: MPU region initialization failure! -12
> 
> Region 12 is outside the permitted values on hardware too. If the write
> lands, the read-back returns the current region number in bits [3:0]
> (MPU_RBAR, Cortex-M3 Devices Generic User Guide), so the probe returns
> order 2 instead of 5. Nothing checks against that, so the bug can go
> unseen there.
> 
> On M-class the minimum region size is fixed at 32 bytes, so return
> that order without probing.
> 
> Tested under QEMU (mps2-an385): the kernel now sets up the MPU and
> reaches user space. Not tested on PMSAv7 hardware.
> 
> This patch was written with an AI coding assistant (Claude Opus 5.5,
> Anthropic): it found the bug in review, wrote the fix, the QEMU tests
> and this changelog, and ran them; I reviewed the reasoning and the test
> results.
> 
> Fixes: 9fcb01a9f54c ("ARM: 8711/1: V7M: Add support for MPU to M-class")
> Cc: stable@vger.kernel.org
> Signed-off-by: Brad Hawthorne <brad@sim.vu>
> ---
>  arch/arm/mm/pmsa-v7.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
> index 59d916ccdf25..a20a43867210 100644
> --- a/arch/arm/mm/pmsa-v7.c
> +++ b/arch/arm/mm/pmsa-v7.c
> @@ -341,6 +341,10 @@ static int __init __mpu_min_region_order(void)
>  {
>  	u32 drbar_result, irbar_result;
>  
> +	/* On M-class, writing MPU_RBAR selects a region; the minimum is 32 bytes */
> +	if (IS_ENABLED(CONFIG_CPU_V7M))
> +		return 5;
> +
>  	/* We've kept a region free for this probing */
>  	rgnr_write(PMSAv7_PROBE_REGION);
>  	isb();
> -- 2.43.0

Well, minimum is not the same as implemented. I still prefer
architected discovery:

| Software can find the minimum size of region supported by an
| MPU region by writing all ones to MPU_RBAR[31:5] for that
| region, and then reading the register to find the value saved
| to bits[31:5]. The number of trailing zeros in this bit field
| indicates the minimum supported alignment and therefore the
| supported region size.

Which can be done with something like below (untested):

diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
index 59d916ccdf25..b746a4e6f9fa 100644
--- a/arch/arm/mm/pmsa-v7.c
+++ b/arch/arm/mm/pmsa-v7.c
@@ -340,20 +340,21 @@ static int __init mpu_iside_independent(void)
 static int __init __mpu_min_region_order(void)
 {
        u32 drbar_result, irbar_result;
+       u32 mask = IS_ENABLED(CONFIG_CPU_V7M) ? GENMASK(31, 5) : GENMASK(31, 2);

        /* We've kept a region free for this probing */
        rgnr_write(PMSAv7_PROBE_REGION);
        isb();
        /*
-        * As per ARM ARM, write 0xFFFFFFFC to DRBAR to find the minimum
+        * As per ARM ARM, write 'mask' to DRBAR to find the minimum
         * region order
        */
-       drbar_write(0xFFFFFFFC);
+       drbar_write(mask);
        drbar_result = irbar_result = drbar_read();
        drbar_write(0x0);
        /* If the MPU is non-unified, we use the larger of the two minima*/
        if (mpu_iside_independent()) {
-               irbar_write(0xFFFFFFFC);
+               irbar_write(mask);
                irbar_result = irbar_read();
                irbar_write(0x0);
        }

Cheers
Vladimir


