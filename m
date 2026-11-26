Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B68C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KnrunxUm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e8uuMufo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6GLhuMbXegNOyHoLyDWvfiTzxggOMPvvXd+1vKENFmU=; b=KnrunxUmDFw9aa
	MTfD8qBBe5N6RCdcpF3fDitYuyxSVQiWsEySPZPKjirKqCdYQXm8Hd2JxLC1C6qMaQ3/VNuvXtEc5
	I935fsgr8DuPRtCQ6F2BKpWB5QTzZFbZrT/rVeHVykqgilV7vqEwXrqKhiJqK9kE55pocucvQkzOr
	+QxxZ2uNAw15JUnY9lc9dJFNyY5g6kNCST3xajhpdNXy9CoakyFmsHIJVM+MMezFUMDmRnBKsevDl
	FblM3NH9wFyE4IyPeDaVNctwb7ersVhOVHL1Rce9xDB3KllHakv3Q2CkkSeOsjzENFk0Zeaqi5utp
	KHP6oo32J2CJqboJWm6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWh0z-0000000EYRc-0EI3;
	Thu, 26 Nov 2026 21:28:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWh0x-0000000EYRT-1MpZ;
	Thu, 26 Nov 2026 21:28:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 685946141E;
	Thu, 26 Nov 2026 21:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0DE1F00898;
	Thu, 26 Nov 2026 21:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795728501;
	bh=6GLhuMbXegNOyHoLyDWvfiTzxggOMPvvXd+1vKENFmU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=e8uuMufoZZJAAQrzd8HyU5U+ybgGQsilFZTR54gz63MDayzI4gWQIDlWmyxPQesRZ
	 iOAF6GQn4A+kiaNF0wCG0J216bmAHUyVeinfoBlm3OmqjZdkU5Rq6lR5lgDLFhm8rz
	 DYobmZZPOfIgcoe237MM9IbvhmZl/YoFBh332SF8GIcfb4h9RNxY+BKyVqBuVpnSdx
	 LMB2FpCCcnERZTSAymFuL3WUWEgT1HK7IRuvTKx8BoCDUoVL91ipUQcwqndSKQw8FC
	 Jb9QRhaH1B/8YIw2IzAdWBfwthWb4C2bZWBlnfpstAEbZ0I5W+5fWgAxCdclaypkjP
	 pjCoCu1G7Gcuw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] spi: rockchip-sfc: add RK3506 support
From: Mark Brown <broonie@kernel.org>
To: ZhuXiangyu <1194781887@qq.com>
Cc: Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Chris Morgan <macromorgan@hotmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <tencent_B239E24A7651B43AC21C4769D1E75FA0A505@qq.com>
References: <tencent_B239E24A7651B43AC21C4769D1E75FA0A505@qq.com>
Date: Thu, 26 Nov 2026 21:28:16 +0000
Message-Id: <179572849657.838304.17453642107387470092.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602; i=broonie@kernel.org;
 h=from:subject:message-id; bh=17xmrTkEbfk8M9MCDD02uxzPPUZzmo258y4i5BQ+1rc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5lhS6bNORXfl9/uyUko1XfgS5VOZra8xbE+gnOK3+w
 Mn9qspnO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRwBiGfwoT1mi71b6OqQl7
 zvv7W2/Wu7hYx2M9ogVv9mWs/OJvdonhfzjnsdM/V29ctTl3xdHMg9wzdmXL75xewie9cvmvCeG
 FWUwA
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The RK3506 SFC reports version 9 but is compatible with the version 6
> feature set. It needs a power-good handshake through the PMU GRF and
> DLL delay-line training for clock rates above 50 MHz.
> 
> Add the version handling, DLL cell detection and training, and the
> optional power-good poll. Parse the rockchip,max-dll property so boards
> can limit the DLL training range.
> 
> Tested on an RK3506B board with the on-board SPI-NAND at 80 MHz.
> DLL training selects cell 64; read and write are stable.

> @@ -375,6 +427,15 @@ static int rockchip_sfc_xfer_setup(struct rockchip_sfc *sfc,
>  	dev_dbg(sfc->dev, "sfc ctrl=%x cmd=%x addr=%llx len=%x\n",
>  		ctrl, cmd, op->addr.val, len);
>  
> +	if (sfc->data && sfc->data->powergood.valid) {
> +		if (regmap_read_poll_timeout(sfc->grf, sfc->data->powergood.grf_offset,
> +					     voltage, voltage & sfc->data->powergood.bits_mask,
> +					     1000, jiffies_to_usecs(HZ))) {
> +			dev_err(sfc->dev, "wait for powergood failed\n");
> +			return -EIO;
> +		}
> +	}

I note that the callers don't seem to check the return value...

> +static void rockchip_sfc_delay_lines_tuning(struct rockchip_sfc *sfc, struct spi_mem *mem)
> +{

> +	if (rockchip_sfc_exec_op_bypass(sfc, mem, &op) ||
> +	    (0xFF == id[0] && 0xFF == id[1]) ||
> +	    (0x00 == id[0] && 0x00 == id[1])) {
> +		dev_dbg(sfc->dev, "no dev, dll by pass\n");
> +		rockchip_sfc_clk_set_rate(sfc, sfc->speed[cs]);
> +		sfc->speed[cs] = SFC_DLL_THRESHOLD_RATE;

Shouldn't we use the safe-frequency fallback?

-- 
Mark Brown <broonie@kernel.org>

