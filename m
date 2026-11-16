Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E743606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 05:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BAQK1JBO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hT9NzDnj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VNX+WPtkvXcf+EOQMuEjoia+Dr8rsdBKgwFXK6gvpAU=; b=BAQK1JBO6sRfo72W33F82QM0eu
	rsIzDQ7XB+E67ViueNucP5ap1cVWAOm3P6/SxL4XK5+zOg0su36HHzhJaoRvvKFQ2dOkJrTjs+7gN
	NLdWRAdeYsDFG0AJymB+t+6xu56uLfw70CsbCd8AHeOmjDEsbRHzrXjWDqRSg7MV4hBVEQ6NofTPg
	0J/CtQ8jjw1H3PcLdXM+5AU3+dpRra0rOG5EWnASNYN2W36VMQ4Q4nEPhuybUYwUCEdZ12lHlBum0
	rTwuEaF/NSPiSkUSfyy0sH4FiJAvMWRJcWxPg+8+++Iu8QyUtUUkasAjkbpEwDCjhDsr9Cym/XVm5
	JUbEDpOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpgp-00000001BfM-1GHh;
	Mon, 16 Nov 2026 05:55:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpge-00000001Bci-07fa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 05:55:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C6A061408;
	Mon, 16 Nov 2026 05:55:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794808527;
	b=AsiFTzXHxZ3agWgoOAeIDLIzq/rycvgWU7SmAauNCGjc/FNX2+3X+wA038qpoCn2s3Lg
	 EY5Wvyjwlxfj1+QgYH6rxSAGDCFAInvM3Fg06aWXnWqzvRQwwRsgVEJH6Fm/RMfClAcx8
	 QfFrc3rwWSG91m685CcKxsjrqbOrY0O6vCl9QjQIJAwIIj3OiqGLrkI7OUVA7qZoHo4q/
	 QoEXiBXgsXW6VLD9da+EA1pq6Ep1glDeZF68kn+H/wsEll4ZehmppqtujZQcpZK8BHqie
	 o4wJWeYtj2T26KdSO1Jj7f9iK35T2bW5Ccal66Eh/ONj/aQB9wnVpgTf0aS9psGkI6g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794808527;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=VNX+WPtkvXcf+EOQMuEjoia+Dr8rsdBKgwFXK6gvpAU=;
	b=v/wO+KM7wJcPo3mABc4WlvtSAr927dNlf/ptW9j+YIbg/zekrGKttRK+MSFmvP30pVOu
	 pQ6lLGYISD32Q2/bBEDWTnTx/LF+T8AtY2/4XAF5fVUmLFoIHxPiBzArrRCx7sLHBtLli
	 AVmsI6sXF4kjcZvvCbiEE2L7fXqAlShwUf2rEV1gG/9fDrchkteLjx/2IEaoeiPX64zaZ
	 L0Tp35VOQEwhP79afQLyPcHuWv4kvzD3eYYxP4ZCWmvFJ8KyzhCCBHHPDol8K1TGYk1vJ
	 KXS+xxLqBY4RVSXFKVkomQSBuOxmQ+o90/341/3kq3ZCohwP1f2qJfnaA13dAlBa3QQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EDA501F000C4;
	Mon, 16 Nov 2026 05:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794808527;
	bh=VNX+WPtkvXcf+EOQMuEjoia+Dr8rsdBKgwFXK6gvpAU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=hT9NzDnjP2j5JJtINzR4Orc6/7T7GpoParFOhUtMAm6jGk+FBjSFNKeVuUfNMlMwM
	 kvxHGgWxD9Dc1+XXv1/ShCFJEufQYWWSZr25YN9hA39PbhjxsuO0OujEPPD1idFhUt
	 FOPK51D2Zpsz1LpF5skk4+rR2YRcGOcbe6ZIAdyCuyuFqeIqAg3UMrcOJ8wY7mbMQL
	 Owzu96LS17Vi8OHIDjDvOXYlKVFqYvmbLrnNNE9DMKDvsXwhDgwAlU80SaUwn24W7d
	 JwmgkxRPprJrGRm8EKGstXnPJSv/9+oR+8Y46ErKB65FMsp0fVYG4XqwqWYp/Nj+EM
	 vHA7IPbbEj+Fw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 511C34A338;
	Mon, 16 Nov 2026 05:55:25 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] spi: sun6i: Add dual read support for the H616
Date: Mon, 16 Nov 2026 05:55:24 +0000
Message-Id: <20261116-spi-sun6i-h616-dual-read-v2-0-e0c66eb71e20@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQ6CMBBGr2Jm7RimQgFX3sOwKO0IY/hLC0RDu
 LuAF3D5kve9b4HAXjjA7bSA51mC9N0G6nwCW5uuYhS3MahIaSKKMAyCYeq0YK1Jo5tMg56Nw0S
 rLL6WVkUuhW0+eH7K+0g/ih+HqXyxHffebtQSxt5/ju+Zdu+Pm5mQMMlLNonJ8tTF96o10lxs3
 0KxrusX0+eYvNIAAAA=
X-Change-ID: 20261110-spi-sun6i-h616-dual-read-562843bc20d7
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794808525; l=1092;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=UssfpM7cd+H4kc8EHiRkjSsNRV0nMySWvKuNCOar8aA=;
 b=o5ph33NBY6zwlbrocmmsY0IBnv4A6gM+ObeF3Ij4Gp9qQz1zhrlub2WBcQ5PeiSs4KN1Ggjua
 2LE1xbAy6sxAR2CVDTtALy60W/bX02Uf91CMzceFv51cDSE6QG41iCR
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The H616 SPI controllers support dual and quad transfers but bind
through the H3 fallback. Patch 1 lets the binding allow those bus
widths for the H616, patch 2 enables dual reads in the driver.

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed them and tested on an Orange Pi Zero2.

---
Changes in v2:
- New patch 1: the binding update Mark Brown asked for
- Patch 2: shorter commit message, no code change
- Link to v1: https://patch.msgid.link/20261110-spi-sun6i-h616-dual-read-v1-1-59bea5a897d4@gmail.com

---
Arun Iyengar (2):
      spi: dt-bindings: sun6i: Allow Dual SPI and Quad SPI for the H616
      spi: sun6i: Add dual read support for the H616

 Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml | 1 +
 drivers/spi/spi-sun6i.c                                            | 7 +++++++
 2 files changed, 8 insertions(+)
---
base-commit: 7a043c9d31af627f0689757b29b8aad6155a9376
change-id: 20261110-spi-sun6i-h616-dual-read-562843bc20d7

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



