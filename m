Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67978606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4ph2fucU;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=R5bc/vnF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/Nhgp+LILdcFaO4Ni0xUg2osLyux7VP/OofLw1qu7Rk=; b=4ph2fucUGEejRN
	R/l8wKLsRBsdZ17P2Qt4dHcN9vfZ4myseDtOXll9nKUrIF6cBZWYNvL889KSSGEqDn/A3oF+hKBbB
	YMojoMDMkiePZ66BdEItALgNW6QaJnykoSLdWOWEnCD4eoOjo7JnyBivSG7UnVsaLaffcOxvIZC3v
	iqBKdc9WJztPaoIooXkVyvt0iW9Dng8KnKEKI9AXRfMMvQ2kDjMJIfubm5MFI3FR+kkz4WVaY++Ua
	mEZlzouSTWmWPnPFzVaY/7MTD0h2uVApxTB5uc5yyqZngpdkHgc9djZugbYKOdsVLV++AFZucsx6G
	dNQNsub8Bo8UCqEBEISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJUT-0000000BGCB-3E8v;
	Wed, 25 Nov 2026 20:21:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJUQ-0000000BGB2-2Eqv;
	Wed, 25 Nov 2026 20:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/Nhgp+LILdcFaO4Ni0xUg2osLyux7VP/OofLw1qu7Rk=; b=R5bc/vnF++APfp5hehLZBjqzbn
	tF+L0Fr05YpjMrIO8tXI3fiSJEtBmea1HWqCAvXIzMlO0yOQ/YJ/OOzggMgP1T7g+ZXCXoqZ69OqC
	1xvkj0H9kXcqaKrInnUEo+rfcAPZOysTw1PGYqDsuDREyYnhp30COoYSR/sKnK3lFIUR8GRPQAPac
	NDyd9EwF+Xb43jbjTrTgGi0QMew1gHqsV4BCRiM9EbmotyosIWfmKDA/yBz8lnvB0ulHP5dmdaiB+
	BfzDiQwwK2PvqNb+inRZtKe5WjphNXmYOxo5JvdfujA235Isj5vn705hcT86lGNqap42/5/UKaqJ6
	FGE7V07g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: rockchip: add Forlinx OK3568-C
Date: Wed, 25 Nov 2026 21:20:58 +0100
Message-ID: <179563805240.3885553.6111189798911467440.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
References: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_122114_611458_839929A7 
X-CRM114-Status: GOOD (  12.65  )
X-Spam-Score: -2.1 (--)
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


On Thu, 19 Nov 2026 04:29:38 +0500, Dmitry Yashin wrote:
> This series add support for Forlinx OK3568-C board based on FET3568-C SoM
> (rk3568). Patches 1-3 add .dtsi for FET3568-C and .dts for OK3568-C.
> Patch 4 adds .dtso for FIT-PCIE-SATA adapter that allows to connect
> SATA drives to the board.
> 
> Note: tested on v1.1 board. On v1.2 RTL8211F phys use dedicated
> crystal oscillator instead of 25 MHz reference clock from SoC. Patch
> should be compatible with both revisions, as in [1] solution.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: rockchip: add Forlinx FET3568-C
      commit: 45935aaba59002a6e50b24ee229b94e7bae1f466
[2/4] arm64: dts: rockchip: add Forlinx FET3568-C
      commit: a673ac719a827dbf813dbfefb277b13c85999c0b
[3/4] arm64: dts: rockchip: add Forlinx OK3568-C
      commit: c5c520d606b87361d9833a06ac7929599d02816c
[4/4] arm64: dts: rockchip: add FIT-PCIE-SATA overlay
      commit: a78448b92c2e03c77d33f87505fd3976385ae9d9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

