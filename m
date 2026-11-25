Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6778606A6AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HJK6UpU3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sd7w0GS2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PmtTlvmM6hCvzvwFyf+XsL7FIz70Z7M5twtwP3LaFv4=; b=HJK6UpU32JQ60b
	BcbuZiLoH37K854nCvrDDZoWzrOdlOmVaJiYpun3AwMdTFrwMyRni+gSLmPcT0Y/SScBHAnCpxREn
	EfEkha9Wg3pz8+uca5zqpbMiVMuzjvYTJkFZlgs7CHHOb28Dm2xUk9EMaVfCKS2eHt0ZT0YMxW0e0
	lRHEUTbXVEHPXtEEV7GB7lz0XVeOpsyoOy6ffmFRHbOALRTFw/ScxIHjJR5T/yPzdi1v+CIHy/3Lu
	JRu2nkT+humliNvvoFw4bY/Yt3AKuxv8y5w+Wn0YBsq0wWBCq3japPTg6KV5+2XK5nEhowzT9AwLU
	o5IslrG+rTdFtPesBDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF3L-0000000ANSs-22UD;
	Wed, 25 Nov 2026 15:36:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF36-0000000ANMI-1x6P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:36:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0514F44082;
	Wed, 25 Nov 2026 15:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649631F000CF;
	Wed, 25 Nov 2026 15:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621003;
	bh=PmtTlvmM6hCvzvwFyf+XsL7FIz70Z7M5twtwP3LaFv4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Sd7w0GS2tV+oPG34BJl7pqxTYnELGWttGNE07HRxbSwvN1i7XxwOA9ncIpcH5EIK1
	 +SJ4/m5htirRajP6p++RZCg1X97imuUipSt543qksmuAI5WO/ByUgzZNULpujbsAE4
	 tZR9F4BJCLr8rxIeREvVrrtkXnX9JwZSV3ZR0m61nx/C1tdpdT5f3n6IEUtkczXwQW
	 yDaCfKlcpsElTOAtjmIsf6DQY0GrDY3f+GKO/cW2FHIOUMHwiRMlhdX8INMuSZJ98g
	 0feoskESs6L3IqP1CmlVxst3hbLZ38yXC//UoXXqC0bO4DZlthnQVeS3wswh/0xzUX
	 evNe+plGvuEfA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 6/8] clk: clocking-wizard: Use dev_err_probe() when
 mapping registers
From: Brian Masney <masneyb@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com, 
 shubhrajyoti.datta@gmail.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261124035613.1968260-7-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
 <20261124035613.1968260-7-shubhrajyoti.datta@amd.com>
Date: Wed, 25 Nov 2026 10:36:33 -0500
Message-Id: <179562099317.458327.5984129720101489360.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=no6SaYSC95ugbFS6jjenpXh2ngHl0wKL9cbLDii/g90=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLZGVqmc9o/vNW4pez+vcWPBfp23LqYtPqHj2Ton8XFG
 9bu2hTm21HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBELP8xMhyXEnSTvlQoMf3c
 o1Uv+k04gxkWlyakJtrteaJteTTwjxcjw57N8XmvlHx+e17fyh93LNx0UoeI1IanxQnsAVFmL7U
 v8AIA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Shubhrajyoti,

> Align the devm_platform_ioremap_resource() error path with clk_in1 and
> s_axi_aclk handling for consistent logging and deferred-probe behavior.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> (no changes since v1)
> 
>  drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> index a3f4c5d6495e..7fe8d0d4cfba 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -1414,7 +1414,8 @@ static int clk_wzrd_probe(struct platform_device *pdev)
>  
>  		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
>  		if (IS_ERR(clk_wzrd->base))
> -			return PTR_ERR(clk_wzrd->base);
> +			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->base),
> +					     "failed to map registers\n");

The Sashiko output looks legit here. Drop the message.

Brian

-- 
Brian Masney <masneyb@kernel.org>

