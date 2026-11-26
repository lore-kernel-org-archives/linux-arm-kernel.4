Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FA2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MUe2efW1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PYTvcMN9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e2qPZaCwApnkHeNTxU5gmYVTrcRMGjT5CR7CxpFXYAY=; b=MUe2efW1kSzDwc
	CTnPj857G5gKiU1FmPJh6wWIgg8rSlyjhC6Gu2YwKm7YIB4U0OmHrtelmy73mgm1JhXwvRiUqq5W1
	ONGGRSkrJAi4OXNHi2q1fGRC3LI6FD1h0UnAgqhelDUX3OM2Uwk+2RML88ozcLqMOEVJoyUjZG61u
	JCOd7q4+A5KL2P7GQkWhnyrc6pYdQO7URJqnnQ8XNJblzD/CK6jnfQhnMBKasIe1WMbGDfKwxpWBw
	m2u+NLfkKa7naZC6BQVojmrAMQrwUDkVInZ5BOeevrNUoXvj6gvHbZzNFBxtxYdsVClJMs8E9cS9n
	2b3IW0pIbE3+9M0vnibQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWddt-0000000E6KV-1xlh;
	Thu, 26 Nov 2026 17:52:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWddq-0000000E6KD-05gh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:52:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5408B4013A;
	Thu, 26 Nov 2026 17:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5C81F000C6;
	Thu, 26 Nov 2026 17:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795715537;
	bh=e2qPZaCwApnkHeNTxU5gmYVTrcRMGjT5CR7CxpFXYAY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=PYTvcMN9lZW7fyQ9+GY6Ol6crsOkGmkg9KNQrPPGvNVNHlzHKvECvaFn5Ba6w4OH8
	 uhVH985MnqUqoxjyFHLE/ea5iWNgXpeMbOmlT/2PAhBlEiJqXyB9e/PiPTYHv4rfdJ
	 VH7npLAJz6UcgCHSCG/z2mET+bhgQuq8Vsbkg8B9UIJ9vMGrk4i5FMNofGzMxvU+Ks
	 tIC39zzbmsu5YCnA6CdCfpxpv/NBiH1XEo2CHPeYtDmwUF3WEckuPngRzrvB+XEZ6E
	 T4syiBgZtNPTRzrTzuWH6BWLvGHJ1etFhJlJfHiSAIGk1SCO67tVSJiwxD6bQ2OgGe
	 /RF1YGt8RFzbg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/4] ASoC: xlnx: formatter: set a 64-bit DMA mask
From: Mark Brown <broonie@kernel.org>
To: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Michal Simek <michal.simek@amd.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 naveen.gaddipati@amd.com
In-Reply-To: <20261125114839.3642735-4-katta.dhanunjanrao@amd.com>
References: <20261125114839.3642735-1-katta.dhanunjanrao@amd.com>
 <20261125114839.3642735-4-katta.dhanunjanrao@amd.com>
Date: Thu, 26 Nov 2026 17:52:11 +0000
Message-Id: <179571553180.142532.15022384187541501041.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Bgbg9/4roZ2jmgAhJQvlkgRt3vbL3rcl5gZVwVsDy7o=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5Cs/4NBs/u5h45Mb7M6xF93x2NH1x+CfUKXnMNOOm0
 s+LR7vDOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRHxcZGX7Xi01zso31OLnU
 f8O6NtFVk5Zd/DW7/uitQw93rhDuV2JlZGhZlfNgjouXzkPj62FmkaHL/nSbP7hw7TBXlSO/YbC
 IGSMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

> hw_params splits the ring buffer address over the LSB and MSB buffer
> address registers, but the device is left on the default 32-bit mask.
> The coherent buffer therefore always comes from below 4G and the MSB
> register is only ever written as zero.
> 
> Set a 64-bit mask so the buffer can sit in high memory as well.
> 
> Signed-off-by: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
> ---
>  sound/soc/xilinx/xlnx_formatter_pcm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
> index fa7419439ec7..57901c9466a0 100644
> --- a/sound/soc/xilinx/xlnx_formatter_pcm.c
> +++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/sizes.h>
> @@ -598,6 +599,11 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct clk *axi_clk, *aud_mclk, *axis_clk;
>  
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));

Is this always safe, can we have instances restricted to 32 bits?

-- 
Mark Brown <broonie@kernel.org>

