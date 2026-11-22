Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B16A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 22:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y60yeBA+;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=SB7lUJ22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dj0rclRX49oBqOsb02p9Kow8s4eln+lcBdmpJYUIU4I=; b=y60yeBA+p7nvsb
	Cefu8S0APnDIeyKFLUhP9iG1lujSplRv1HMnQCV4Cr7mUGTKoiEBDiMUQIxGjt4y2/RTe8/93yOq4
	bKBfRZgsEC9Ei3p+8nQBD8lMJQ8pkVrTU8KG1dNAkM9oiSjZKk7KaCQ4fhsHXq56616Cval6OEJcS
	h2HuR9kX0MIRp89Fz/akxACXUXTj3iYROmbG04eUJjb/SZ2HeTtBrE0SMkrNbNDzXl7M5Be0nUn7n
	974nAELY1SOGEdYhD2NZNtYy2x8guumGsDNHeYW7nWnbx0ZvxnW6zIrv3DqQAj3tjET1THfl6cRR1
	gYOR2xmLpaN0NTsorGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGPS-00000001rk4-1XHt;
	Sun, 22 Nov 2026 22:51:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGOT-00000001rKg-1vmF;
	Sun, 22 Nov 2026 22:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dj0rclRX49oBqOsb02p9Kow8s4eln+lcBdmpJYUIU4I=; b=SB7lUJ22a0e31KYQQfWOHck+ln
	Eje56ysbXR7MJhNPoO97H2wqLYkfg/NUkwGTqlNP8A7GnW68vc6qHrIYfSdOESSE9UAVAqhdeOIxz
	rH2Ttcij5J59EDu+2qKxOmPpOSDe/q1qyaZiDNk7QkDa8M+pmpPGOLOzpfO6eQpRCFOJfQjTkwQfM
	Tw20Vso1VWmpk0LS6m6G6RRy25GZ3hhSXX/CkfGiLT8cqYKrI5H4fE9XvxVyiGRZWNJpDkX+aEi9i
	UbTSQS4lwshIDeLEIpc3nzMrzCf48bgUg1qZ4v+UTE5PUI347TyVVt27T/GaIAkFLZqaYm7PnzmuA
	zia7Zi5Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: Coia Prant <coiaprant@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>
Subject: Re: (subset) [PATCH v3 0/6] arm64: dts: rockchip: fix GMAC clocks and USB OTG power on RK3568 boards
Date: Sun, 22 Nov 2026 23:50:21 +0100
Message-ID: <179538782477.3150822.9311810146574826911.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_145045_528111_4970D1C3 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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


On Tue, 03 Nov 2026 01:44:44 +0800, Coia Prant wrote:
> Changes since v1:
> - Patch 5 (USB OTG power): Reworked the power tree based on the schematic.
>   Instead of tying usb2phy0_otg directly to the boost, model the OR-ed
>   5V_OUT rail explicitly. Add vbat, 5v_boost, and 5v_out nodes, and fix
>   the vin-supply of vcc5v0_usb30_otg0 to depend on 5v_out. Drop the
>   incorrect phy-supply change on usb2phy0_otg.
> - Patch 6 (modem power): New patch. Fix vcc3v4_rf vin-supply from
>   vccin_5v to vcc_syson so the M.2 B-Key modem does not lose power
>   when the board runs on battery.
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
      commit: 1b14b7c656147a8288b85aef4988007f0458e256
[2/6] arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
      commit: 3ff840ec8cd331b304836ecd716c674fcdee15b9
[3/6] arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
      commit: 39594d438bfe0961d975d5428a325dc07aa47342
[4/6] arm64: dts: rockchip: fix GMAC clock parent on Photonicat
      commit: 5925f9674f34ba53888fcd3ba21b143bfa835c27
[6/6] arm64: dts: rockchip: fix modem power supply topology on Photonicat
      commit: 9dc1e2851750ed78d46ea52028a69d3eb36b6a65

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

