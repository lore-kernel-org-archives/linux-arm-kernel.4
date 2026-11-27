Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377E9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CH6TSHOF;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JXbB92Su
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LtJEEQG4iK+tOAIiGdDHJtxrocD8+I8V0KWp8R71igo=; b=CH6TSHOFzlqc2M
	V1EK0IE7IA7nkJ+VxNdpvm1h95hxAWz2EEorX3w7UY64IYqxFuQHciUtjC5nAhPUJhBvO91MzYJUb
	TdyTeBIGF3tk0g6cZIX8Nh+7grqB2S8NTVp8xN9Vco55Mn4yTHC/Vb1Q4+b5o1deCzyt/Mq5mVNOP
	sCfXmi4Rg3d7L/2kMZDbjimkHMMUxbKzfXUlr+KADpOuG6Win1Pu7qNwm3oDL56gQL9ZE8Si2UvuU
	KHClvegwp+MBmZ2kIxQPwKcUXHAoqmT7Hc92GVbgnAYCBVbz0G8kg04Yrs+q4BmiW30rqxF/PwLqJ
	4AjV482V32ym1c4iwGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvax-0000000GDTA-0AAm;
	Fri, 27 Nov 2026 13:02:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvau-0000000GDSO-0mby
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:02:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9198C1570;
	Fri, 27 Nov 2026 05:02:21 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E46513F86C;
	Fri, 27 Nov 2026 05:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795784544; bh=QeFOK6g8h2iQ2txNI2mx0B0PPeSALxkLl0Q5BbCVDmk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JXbB92SunCgR+kVz71rmMiUis52LA1z+gix44AySQQhACoDyc0LdD7F+RFyIqqgN2
	 BGftvxnt09g4GhWHRASIwOxPtgey38xSjx5/hu1Ay7j+RDY/Ifx2fPDgpSoz3UEbZ2
	 2pCGVjA4EEaDZgJEFaYNECT83+NmviaX6/uZyfpo=
Message-ID: <6fe998dd-cb41-49ee-8018-26071d347db5@arm.com>
Date: Fri, 27 Nov 2026 13:02:20 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "irqchip: nvic: Fix offset for Interrupt Priority
 Offsets"
To: Yoshifumi SHU <envzhu@gmail.com>, Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Brad Hawthorne <brad@sim.vu>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <20261127122801.4189591-1-envzhu@gmail.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261127122801.4189591-1-envzhu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_050228_277840_7513B177 
X-CRM114-Status: GOOD (  16.02  )
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

On 11/27/26 12:28, Yoshifumi SHU wrote:
> This reverts commit c5e0cbe2858d278a27d5b3fe31890aea5be064c4.
> 
> nvic_base is mapped to 0xe000e100 (NVIC_ISER0). Thus, the Interrupt
> Priority Registers (NVIC_IPRx, at 0xe000e400) are offset by 0x300 from
> nvic_base, not 0x400. The reverted commit overlooked that nvic_base is
> already offset by 0x100 from 0xe000e000 and incorrectly changed
> NVIC_IPR.
> 
> Link: https://lore.kernel.org/linux-arm-kernel/b0be3be5-3a7d-469e-9166-a3414a52cbea@arm.com/
> Fixes: c5e0cbe2858d ("irqchip: nvic: Fix offset for Interrupt Priority Offsets")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yoshifumi SHU <envzhu@gmail.com>
> ---
> Vladimir asked for this revert (see Link:).
> 
> Tested on MPS3-AN547 (Cortex-M55) and EK-RA8P1 (Cortex-M85) hardware
> against v7.4-rc4. On EK-RA8P1, confirmed that the driver now writes to
> the correct addresses for NVIC_IPR registers.
> ---
>  drivers/irqchip/irq-nvic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-nvic.c b/drivers/irqchip/irq-nvic.c
> index 2191a2b79578..9438891e66f2 100644
> --- a/drivers/irqchip/irq-nvic.c
> +++ b/drivers/irqchip/irq-nvic.c
> @@ -26,7 +26,7 @@
>  
>  #define NVIC_ISER		0x000
>  #define NVIC_ICER		0x080
> -#define NVIC_IPR		0x400
> +#define NVIC_IPR		0x300
>  
>  #define NVIC_MAX_BANKS		16
>  /*
> 
> base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
> -- 2.53.0
> 

FWIW,

Acked-by: Vladimir Murzin <vladimir.murzin@arm.com>

Sorry for such silly mistake!

Cheers
Vladimir

