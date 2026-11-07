Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44B606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 17:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=odsxQNr5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6yHADH8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yXwGL1AZc0M9lqEVf5JtZMTpSZJEBwrczEg6pRkVWnI=; b=odsxQNr5nTTpiA
	3koCZxBp9mxxpf066Rv+UbI3gnF2sW8StCErX/GWirwjjvtU0Drm5pccQHRcXsc30bKO1UXt9K69m
	KhmEmm+7RfTvs3pE1EWNr7uLCjcoOUFAaV4rEPHiJaBl416yz6Jf/dMtu4W7oJ5cHWwSZUu/24FOm
	BVILae4npDwoykX/l1PNMCUTwAVGVnG6r9X7yl567i0+sDa+BoOdCvM1ZT1KJ20Cn0orb7lH4tbgl
	0/7+JeBu69Zmmo0f2fhr7/U0UHZcuw18aluVPbHyA5Tn9qTZoD1k5S2wNScPxMtsLW77bOGkkKW6Z
	Uhmhkmk5BFeOnvID6nJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjrs-0000000F4ta-1lIl;
	Sat, 07 Nov 2026 17:06:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjrh-0000000F4lT-0UJJ;
	Sat, 07 Nov 2026 17:06:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D784D403D7;
	Sat,  7 Nov 2026 17:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E661F008A2;
	Sat,  7 Nov 2026 17:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794071164;
	bh=yXwGL1AZc0M9lqEVf5JtZMTpSZJEBwrczEg6pRkVWnI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=d6yHADH8x1hJEqQF3nfvVmum2rHernfhB1XW6CMvJadKyl5nktUDfeupkHstjCnNf
	 rvpKZOpwSQ0sZqo/WsBO7E2riroV/Js0ZaRbqHUWd0YoQLe6/5X9rlXIm0qPP7HCeL
	 TZQ+JL9dJTyyQrSBI8rZA+G9xvPgQhEwo0EVih5cpG9gHobzwtMjHSUcTCiElsoNhM
	 1oC78OQ1SSxgHrJrb8KDMxpM1DwgOev9YYXoM7phN2JLHfnc1XCFpShHN0LwErHwBb
	 uKWX/PlHq7oMvCqukq8OT6h2K8+bcwme+AeZaIgVrbRDalKzF2V9Z6m7TzgmUvgDzh
	 d099+0JQQV/9A==
From: Manivannan Sadhasivam <mani@kernel.org>
To: sergio.paracuellos@gmail.com, lpieralisi@kernel.org, 
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 p.zabel@pengutronix.de, Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20261101070121.2714-1-sreekuttan2156239@gmail.com>
References: <20261101070121.2714-1-sreekuttan2156239@gmail.com>
Subject: Re: [PATCH] PCI: mt7621: Fix reset control leak on PHY
 initialization failure
Message-Id: <179407116392.87368.9250979022176600686.b4-ty@b4>
Date: Sat, 07 Nov 2026 22:36:03 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sun, 01 Nov 2026 07:01:21 +0000, Sreeraj S Kurup wrote:
> The PCIe port initialization code acquires a reset control handle using
> of_reset_control_get_exclusive(). However, when PHY initialization or
> power-on fails, the port is removed from the PCIe port list without
> releasing the acquired reset control handle.
> 
> Since the reset control cleanup iterates over the remaining ports in
> the list, the removed port's reset control handle is never released.
> 
> [...]

Applied, thanks!

[1/1] PCI: mt7621: Fix reset control leak on PHY initialization failure
      commit: 1973b0f280bb753e0810346a9377766c38230752

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



