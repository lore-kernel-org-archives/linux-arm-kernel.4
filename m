Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291DD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qYFY9wI3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SahMT15e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d2gkvcTQhqVNxfgCYpbytR0aMjvFOwtBiuoUNwkUCk0=; b=qYFY9wI3kQozbF
	o9iWA+s1DAGBD7awuiwMcmd7cBDiY7uu7JbdiTHt8bjFFEkogc+qYaF9qWrF8g51Xn6zTOXzQ4bmi
	em6Qc3/qSJOowdKKRWXYpB5uPdV1NHT4NeJTveo+sbGbbMEncHqLsRVH+g4gVODPVWZ5i1vfpKsJi
	4NjZz11Q6PWsyv/xpDJ/EESvLgDJF4CP7e448vim8tnX8nNk8TRK+S/PGBpqbi70wk+LLIeCwPYil
	LfDKcG2/iM2NEabfTj8tdOAcS5a7DF8Fkily0SEMCm/avt5cw9UIJ0/99iFpKN9AJGt9xTPSPgr+p
	p1ZVKv4/Z2yvjqb5aQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyJc-0000000Gw2p-2lhL;
	Fri, 27 Nov 2026 15:56:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyJb-0000000Gw24-2j09;
	Fri, 27 Nov 2026 15:56:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C69FA6215A;
	Fri, 27 Nov 2026 15:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CB11F000C1;
	Fri, 27 Nov 2026 15:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795795005;
	bh=d2gkvcTQhqVNxfgCYpbytR0aMjvFOwtBiuoUNwkUCk0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SahMT15e+Mw8bAI3qm/C8CkEpyrR3poZcyCCG+O3cQx/PUHk9GfyAd/1do4Wx09tH
	 SVZYDRZQ2Z3tFtdt9/SdkTl7EFvsCFwa35DZvfJdAX5PyssJSV9xNG98om1UcQjzMY
	 TgbhKZCxj+ZAYJKlG4mNFdjxKawhNhib8uQv0ai4DqlEHMuq2RwBzE+FKttsMu37Un
	 mFJHBoDCP2nwtg5kR/ht61Gan816Fj0/c/QkQn+2f/D1IWYp6+5iqAMeMmJV7XTz8w
	 knswM4qqBz92Rnqr7LhnPJZHB98XtO9jeMXitI00L7Ig19H/5ymjSVVNxP0aCNrWSV
	 7Jws3KBb1LkIA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] phy: rockchip: inno-dsidphy: fix 1.5 GHz rate units
From: Manivannan Sadhasivam <mani@kernel.org>
To: ZhuXiangyu <1194781887@qq.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Manivannan Sadhasivam <mani@kernel.org>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <tencent_6A9CF9A2529C8FA2C04933F2D5D1A259B506@qq.com>
References: <tencent_6A9CF9A2529C8FA2C04933F2D5D1A259B506@qq.com>
Date: Fri, 27 Nov 2026 21:26:39 +0530
Message-Id: <179579499956.13164.15319858609781281248.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195; i=mani@kernel.org;
 h=from:subject:message-id; bh=JKpbtCK2JkAgBPs2b311Dibv7xLHsRcbwvwSIjvxYW4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCag6Y2hXrBVdQE7US8NPgGPvLjUq4b8u/F+Rb
 8vCxkS4y5GJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmoOgAKCRBVnxHm/pHO
 9UvJB/4r8pSs1S39KS8J9xLmWC1tD6KVIPYe/5oi87nxtREL0A4zFzNW4jB/UaVA0qFtCRryvrj
 u8XX/58IyKvQk1lQ/ov6I1lHpRHdjL/GA1L4erSlDnKsrIDbo9pmLE8gy4TbK6nTaPh0x+qXcRi
 xU5Xwpv+/KTNB7fg8AW9AiI0zUZDMOuQrYXSIuysKmytoOa40oggHDPNj+FqyrXFTGyvj4yuk0/
 y5WHSqoRkLVLgWR9optSPpCgnRNztbKEygHL3ac+IpbfOHtJEphlJn+PfbqxoLMFnvvO5OWA2v4
 4F1sBxvhsWTpr25gLtW2rq8Wg+yIsw1SB5ULHCrjX4o4e3LY
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-22 01:11 +0800, ZhuXiangyu wrote:
> The 1.5 GHz Innosilicon DSI PHY timing table stores its rates in Mbps,
> whereas the other timing tables and the lookup loop use Hz. When
> enabling a mode, the driver compares inno->pll.rate in Hz (e.g.
> 372000000) against timings[].rate in Mbps (e.g. 400), so no entry
> matches. The loop falls through to the last, fastest entry and programs
> an excessively large TLPX/LPX counter, preventing panels from decoding
> low-power DCS initialization commands.
> 
> Convert the 1.5 GHz timing table rate values to Hz so the lookup
> selects the matching entry.
> 
> Tested on an RK3506B board: the panel receives the low-power init
> sequence and the framebuffer console displays properly.
> 
> Fixes: 785a9d5bb145 ("phy: rockchip: inno-dsidphy: Add support for rk3506")
> Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
> ---
> Changes in v2:
> - Split out from the combined drm/phy patch into a standalone phy
>   subsystem patch per Heiko's review.
> - Limit recipients to phy and Rockchip maintainers/lists.
> - Fix Signed-off-by author name formatting.

You fixed the sob, but patch author is still not fixed.

- Mani



