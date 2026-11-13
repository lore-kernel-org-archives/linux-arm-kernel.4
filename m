Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9839C60A261C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EbaWSFfF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cKaxfs3Q;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=HeooFUrx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QuFwSAi/+d10dPqCgFOszj9I6LnlETDJ/cydaZMm5dc=; b=EbaWSFfFfXbyOL
	9l0SOaOi0Yy03WZ1EXJt9FKq33f8sgRiJ5XIkQ85wlfphNDqe+rNDriM00bz96f6hvcASk21X7KBI
	8S/vT3TzeMh7EifjeBqk0B/A9Li8vsMNTj4K01RUp/rFlBlCG06oEDKGJpBbfS8UOBX6FsiwegNM9
	/1VKXgMv+qhCBbq99+2d035RQOcUHLrVxVdoKNWcFsVqTJhHIOcqjDHrLiuOW+WqVrR9QSS2G0jO8
	VRSZWCJoUlKgh5n4DpC3KOGBqIMltSmu7b0E234qjXnynNLpSoAivehDUpZfySTpjKeQqJ7UOBKQv
	cgHpQdji6Hk1HL8d13Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyVi-0000000EWvm-0E0Z;
	Fri, 13 Nov 2026 21:08:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyVN-0000000EWnZ-3A4v;
	Fri, 13 Nov 2026 21:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QuFwSAi/+d10dPqCgFOszj9I6LnlETDJ/cydaZMm5dc=; b=cKaxfs3Q2T9hHQzaoYb6/nAmR9
	f49wKmlbPB+hu1fvByrh0AanVK6qgV45PeWRv27mYLULISsHs55YNsR4u3PWRIlho+o74QdBRBgfp
	pOK53rI8PhSixGotPSKtiFzc7FTYIJpOdCZbuqdIiv33fVYRRsyObaFjWlLQylW3PlQhfnzVXv/gD
	xMi8yZylJ56H9h/+zqkpxECO9ZaND15F4J5cq7jVIl3VsLx6phpatsNjOVo9o/HOVJn64+LHVW/vv
	X1fhCpY6X8C6a4XFSVS5/Pg1ozS+ht0IByNYUVRZ2SbnjANQUZowh2LT8+YzmFqpxJ0vSpsxsU17F
	dJhWAkJA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyVK-0000000Br4K-3U32;
	Fri, 13 Nov 2026 21:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=QuFwSAi/+d10dPqCgFOszj9I6LnlETDJ/cydaZMm5dc=; b=HeooFUrxRI80cVLbD8RuYzIOAO
	ZPFPV2Kq7Wg+hLjTmJ3qDg3zMaCUU4nsECnm2psXGp2QoPCkUFJU/lI/ug52hcmDHKGVDDsYf/p2n
	PYBnZtfHvfyarN/jgTua30Jg+Dk8GcQGx2hHn+vqNbDI86xyg6n7xzHtE1vilnlYrS/Ag4slcD3DU
	xlLuuM4LIbSQoH8l23PgDRJY/NhacGdHmCDls1Vgfzkjx1PV8F3iW9yLBejm91ytbSbrVKkT9VVJT
	v37QrLbpu5quuVv0VzlA/UWkXT6GQs1X6/VQYIAtKWA6BTgw2VFjTtynIIBGDZIWJmXoC6aST2NNi
	tvr4PWDw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Alexey Charkov <alchark@flipper.net>,
	Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	luca.ceresoli@bootlin.com
Subject: Re: [PATCH] arm64: dts: rockchip: fix pcie wlan chip on rk3588-h96-max-v58
Date: Fri, 13 Nov 2026 22:08:04 +0100
Message-ID: <179460406444.1165597.590397049163238524.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-fix-h96-max-v58-wlan-v1-1-7e918fc85b88@gmail.com>
References: <20261112-b4-fix-h96-max-v58-wlan-v1-1-7e918fc85b88@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_210814_909729_839753A7 
X-CRM114-Status: GOOD (  12.47  )
X-Spam-Score: -0.2 (/)
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 12 Nov 2026 19:34:56 +0100, Joachim Eastwood wrote:
> Correct the gpio used for regulator-3v3-pcie. This pin was found digging
> through the vendor dts. Also add the this regulator to the pcie port so
> it will actually be enabled.
> 
> After this fix the BCM43752 shows up in lspci and WiFi works with the
> correct firmware.
> 0002:21:00.0 Network controller: BCM43752 802.11ax Dual Band Wireless LAN Controller (rev 02)
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix pcie wlan chip on rk3588-h96-max-v58
      commit: e794aacace8ed0f3ee1aa34924e25399d370e039

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

