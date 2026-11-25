Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AA0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=azUnV5ai;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=C4/4RymZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lI79yVcuwlWNNmqWKJMamTv4DBtZCc31yF8jhwybto8=; b=azUnV5aii2c5Ubc8P5Kb0GJVCD
	yxfifdq69F1sJGQ6w3oIw9N1N+z7X8cDrV+LORkO2oQ3QDrY79+smcefOKuE4vAR8Wic3/OFIuuYq
	72yA+eKaVzuKThIM2M3nO+0ypKVegIUoZqMWbJ3PEuzkCi2NRdmyvLZZPue7VuKT37yOlOOnmUAz9
	/7Gf8DXcQOE5xyHf9Bo27PPTUZDZtLn6XxVlW/2M4QIasc4cUFyRLJtylIXmZ0ckQ9UpufBvMBzKc
	Z6w0r5NesEIsjx+s2w2dXeRZiwnKhvLOz6NDHOc4C4QO6g7Jh2EW8tvnURkBY+OYoF6H7JNq6gqHG
	mRRnaOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7RM-00000008suB-2EGR;
	Wed, 25 Nov 2026 07:29:16 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7RB-00000008smM-0eik
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=lI79yVcuwlWNNmqWKJMamTv4DBtZCc31yF8jhwybto8=; b=C4/4RymZ3Rx9j1EeSHtOBAARtX
	uJmedBRiy9r9zrjYCDOwzFNpCxiRwYgT8193VTauZKvubaBEEkpiUjkG+CMP5SFnRJwhhqpkPyJpO
	QGJgTNQ1al0PrHKi1tIkG0TED4Z8klMjmDaHWmAiF4288rBlRWO4ebBr4Z4h3daBvDaEqbGEz/3GC
	7/vuHPBWPFTHq9Nxfpf//ip8lnkeByPrIqayjp4S7txQ0k06bakOiGk7UJasydbZFFyXKScUotl1J
	yAXTuNpopamm+YNjeaymLFFapmatPeIvm0EHRk1VgvGguiaxapIn/kg+2Qhp6CKcFBYKk7sX/2X9d
	SldI3cFA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R2-000Fh3-0y;
	Wed, 25 Nov 2026 08:28:56 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R2-0007YA-13;
	Wed, 25 Nov 2026 08:28:55 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v3 0/7] TQMLX2160A-MBLS2160A DT fixes/updates
Date: Wed, 25 Nov 2026 08:28:43 +0100
Message-ID: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.6/28193/Tue Nov 24 07:27:44 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232905_362417_1A3330AD 
X-CRM114-Status: UNSURE (   7.78  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

this series adds small fixes and improvements for TQMLX2160A DTs.
The DT overlays address specific hardware behaviour when serdes is
configured differently.

Best regards,
Alexander

Changes in v3:
* Rebase to next-20261124
* Drop patch 7, already merged as commit 1c896b0b996a8 ("arm64: dts: imx:
  remove unnecessary #address-cells and #size-cells")

Changes in v2:
* Updated recipient list
* Added patch 8 to the series

Alexander Stein (1):
  arm64: dts: fsl-lx2160a: Add vcc-supply for SPI-NOR flashes

Nora Schiffer (6):
  arm64: dts: fsl-lx2160a-tqmlx2160a: fix LED polarity
  arm64: dts: fsl-lx2160a-tqmlx2160a-mblx2160a: use DPMAC 17 and 18 for
    SGMII in SERDES2 configs 7 and 11
  arm64: dts: fsl-lx2160a-tqmlx2160a: add aliases for all 18 DPMAC
    instances
  arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: add various GPIO hogs
  arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: enable pcs_mdio17 and
    pcs_mdio18 in appropriate overlays
  arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: specify Ethernet PHY
    reset GPIOs

 .../fsl-lx2160a-tqmlx2160a-mblx2160a.dts      | 306 +++++++++++++++++-
 ...l-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso |  20 ++
 ...sl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso |  20 ++
 .../dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi |  31 ++
 4 files changed, 367 insertions(+), 10 deletions(-)

-- 
2.55.0


