Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265B0606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LF3Z6TXv;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=SjNvkuYc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Pc0ojdFZzlnG3jrdmVTzOVzlBAOKTUij29AsDO7jazM=; b=LF3Z6TXvLZl1Yp6VZTtX6OPJYX
	CXneDER+Sgge0d75KgNJVuq0LvYOZxWB3yEhJ2Axp8k+BSqkFYRDrWptRJDxum0cyCWqqiNKiMpmu
	GHC6Ebgs0VXCqKDm6qx1Aypoq8tzbsWea3wyq4Iue/6WFBsIWypOs/tvHXIO6wBlVO6cGsqqx1NMH
	EMSzuDZ2uwzuSvmoQ2kwlHD92OOF3dn7/as6//JItxrxCvWhAXNtLmNBKifzzKVrN+cFEOCw9a6Zj
	1CM6S0EJdasXXXMFndxQXaQMipLbE8oZLBq5WPbwMatDxro6biB9Co0w2OJhira0aPwo6IsYyoiHT
	WfOLgpPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVTg-00000003qOa-47fd;
	Mon, 23 Nov 2026 14:57:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVRp-00000003pSE-1PtK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795445721; x=1826981721;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=cjk51Qv5NMuDXe5avYRemMt+9GS69CVYjYKcxrWGVVo=;
  b=SjNvkuYcc+fB3v1v2bIGrikv8jtnmv/uA7BmFgVOWszfZs+ez6t7TKhO
   mXA0V4KfPH7ke1hXYXJk17ymEe1kULLsGByjplvrvgU28+TUUXF/7QvNL
   D/zfoIf1yz+1jlyn0D7zYrA/+8gaY7jV1mZrfbf9BOwxAQSfKQr0EyIji
   CjaYqU77eK+Y8RIfI1/LMpCHq49a5yh8tJUdbIBNA4tXXtmQegQOB2j+2
   VMuZYYhd1LNmgyXK7La3MEgFoHBbkE7EcO4Tjm/aS6+VJWoNnsvjv2SmT
   JkA8g62ONej0N2X38Tlob7ydwsz3TRi12VALNKkT4+Wrn272aU5/icNKs
   Q==;
X-CSE-ConnectionGUID: 2czfgEj2TimuzdtdpbWqXQ==
X-CSE-MsgGUID: Lwuha7/dQMOrZsaV6NzSRQ==
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="233973959"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2026 07:55:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Nov 2026 07:55:11 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Nov 2026 07:55:10 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 23 Nov 2026 15:55:04 +0100
Subject: [PATCH net-next] net: microchip: vcap: initialize the top address
 of every VCAP
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261123-microchip-vcap-top-address-v1-1-fd1953fad422@microchip.com>
X-B4-Tracking: v=1; b=H4sIAMdTBGsC/x3MQQrDIBAF0KuEWXcgagmhVyldiP42s6jKjIRAy
 N0rXb7NO8mgAqPHdJJiF5NaBtxtorTF8gFLHiY/+8U5H/grSWvapPGeYuNeG8ecFWa83jEHv6Q
 VIdMImuItxz9/UkHngqPT67p+kD6NhXYAAAA=
X-Change-ID: 20261123-microchip-vcap-top-address-84e0326c8e3d
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065514_090624_B93FBB02 
X-CRM114-Status: GOOD (  12.80  )
X-Spam-Score: -4.4 (----)
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

The sparx5 and lan966x block init helpers initialize the address range
of each VCAP instance, from first_valid_addr to last_valid_addr, with
the VCAP initialize command. They pass the range as a count of
last_valid_addr - first_valid_addr addresses.

The range is inclusive at both ends and holds one more address than
that, so the top address is never initialized. It keeps whatever the
TCAM held after reset, where it can match traffic until a rule is placed
there.

Pass the full count to initialize the whole range.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan966x/lan966x_vcap_impl.c | 2 +-
 drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_vcap_impl.c b/drivers/net/ethernet/microchip/lan966x/lan966x_vcap_impl.c
index eb28df80b2818..c0bd831a32a88 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_vcap_impl.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_vcap_impl.c
@@ -659,7 +659,7 @@ static void lan966x_vcap_block_init(struct lan966x *lan966x,
 
 	__lan966x_vcap_range_init(lan966x, admin, admin->first_valid_addr,
 				  admin->last_valid_addr -
-					admin->first_valid_addr);
+					admin->first_valid_addr + 1);
 }
 
 static void lan966x_vcap_port_key_deselection(struct lan966x *lan966x,
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
index 2dee2ce19fce7..b2e76bec8edba 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
@@ -250,7 +250,7 @@ static void sparx5_vcap_block_init(struct sparx5 *sparx5,
 {
 	_sparx5_vcap_range_init(sparx5, admin, admin->first_valid_addr,
 				admin->last_valid_addr -
-					admin->first_valid_addr);
+					admin->first_valid_addr + 1);
 }
 
 /* Get the keyset name from the sparx5 VCAP model */

---
base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
change-id: 20261123-microchip-vcap-top-address-84e0326c8e3d

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


