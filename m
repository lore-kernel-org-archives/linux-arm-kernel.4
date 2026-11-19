Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CAA606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ia8UGX6N;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=kVFQqDBC;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=E4sAS0c1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KPwgoK2ctYkEIoXLDhQ+9ixRvnytQ+HTp/D7L99rIqE=; b=ia8UGX6NmiyiD4nM6SWcOyhs5b
	Bd3YTDNWGBJIf2W7xL/wx7XpFtvzio9LFK3RNaOyxY10H0xtAS6YjZqEKJJmS40jPcP28lYOH/fu1
	FAoujEiaACInEmZtDi5ZrcqIB/sMWMZd7sIPtsdwzVsHFVapT39TJs6hyuzeuxZX6wb0mL6whOMLV
	75Gjpswj5mCaOha9Md3zNs3G7LU5+SyJVqTnLwUVaB27qvo9azX8EGKjjV9F1FGs44kOhe6GatT/M
	DNCGlrjNDvcZDrcnbcgEJG37RAByTEZtizflFzRcuSp3R/Wi2JqGF4PmIf/2WDEf5ui+1fEgf2vCv
	02AgrUzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU12N-0000000BojO-0DbY;
	Thu, 19 Nov 2026 12:14:47 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU12K-0000000Boim-3S4S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795090483; bh=KPwgoK2ctYkEIoXLDhQ+9ixRvnytQ+HTp/D7L99rIqE=;
 b=kVFQqDBC+crWGyazLnC0gyGSRFkDlZUWjtBodVuMawOZAp7v725i9zKg75Bj/Te0MOc17x1O+
 ni08GL2AcjO90b+rv68hAZpgEKeMh30Y2NrgQWOejcI8bXZ+S5Lyp/pZxiR0ahKdHOAV/DpuGEH
 bVVTF5KMKoUPg5yH8+rP6+1FniblEzyJqM5WPfzqrZwB5UeT0iZ1PjW0W0i+0npMSC1QX3AZtR/
 +aHGAYpGsKSfcXb/lwe8ERaEueh+9ObiE5W2iiRHho20VqV0Npzx3rYvPlylcq3Ov5bIUnEM2vS
 oMy8mFw3P88zeJyREmJKyrjEDuz6Fm2+3iktfbOiOSvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795090483; bh=KPwgoK2ctYkEIoXLDhQ+9ixRvnytQ+HTp/D7L99rIqE=;
 b=E4sAS0c1ftV4X1auGU4iAWL94ziJboI2mwUr70kbLYiCHylqnWJqdKDEVo+zmE0QPlXkYg9Il
 wOLBOK34xR01PNU0QAkPVmN04HTzhAWlfqokX2MDQIfsVPXlA4FMme+L4s7zn5Hg++Y85pa0bLZ
 bZFaLFJWE102GwOpZ2Jfjng=
CFBL-Feedback-ID: 6afee831d37bc4966df160da:3d0014e63e262de90a9d6bb08833dc93
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6afee831d37bc4966df160da
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add FriendlyElec NanoPi NEO3 Plus
Date: Thu, 19 Nov 2026 12:14:30 +0000
Message-ID: <20261119121433.550704-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_041444_921142_AB00863E 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.0 (--)
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

This series add initial support for the FriendlyElec NanoPi NEO3 Plus board.

The FriendlyElec NanoPi NEO3 Plus is a compact headless SBC based on the
Rockchip RK3528A SoC. It shares most of its design with the NanoPi R28S
and NanoPi Zero2 boards.

Jonas Karlman (2):
  dt-bindings: arm: rockchip: Add FriendlyElec NanoPi NEO3 Plus
  arm64: dts: rockchip: Add FriendlyElec NanoPi NEO3 Plus board

 .../devicetree/bindings/arm/rockchip.yaml     |  1 +
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3528-nanopi-neo3-plus.dts  | 96 +++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-neo3-plus.dts

-- 
2.56.1


