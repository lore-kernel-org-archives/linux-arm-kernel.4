Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DB1606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 04:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nCO9txzZ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mcYpOGOL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ry895IeeCwvvoVrLKPY1qGl5vh7XehrgPQ0oBew1BlU=; b=nCO9txzZI4HlKQ
	RKw0vnxP0RXlFhCkBfQpzjWfC6pSfp2KIoevRI5OPVQuB+YOomMB30YZiosSm1SeYUWjXeMxtn6sF
	SkkBEBv4/urKtyxAY+FXUOhV1mEVzxn/B50rWt0ORDXlrJheu0VUWt8tyYf7dYk/cXmkULYb2Umii
	JL3qqPlp4pHwW/5PvdrCS4TudtiOrDhWwucJxpzYIE/TpRMLF9jHclJq/hlHIs3vPC+5zLovikk4S
	cmvQhhkgMmX8oQHrAK52oUPRl8SoDg4o/hD2hWgQavARmH8/yYW+F3lnq+DP/aPSMJ4BJGn5SJLJ4
	W655xosLhxnJoKgYMywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4lW-00000008P1i-2x4Y;
	Wed, 25 Nov 2026 04:37:54 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4lE-00000008Oop-25l2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 04:37:40 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8b600fae14dso1808456b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 20:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581456; x=1796186256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ry895IeeCwvvoVrLKPY1qGl5vh7XehrgPQ0oBew1BlU=;
        b=mcYpOGOLfyeawVhrWqXEETmSUI7UnINvjCT4ciFuJkaNHIkn0UENW/lVDswpXReanp
         SGrBru2nIdGX66HdVFEsvJEyt8XhDfMNku0VQMvWYZtVXZDKBw3KAW5YvODOJLpsiSrC
         KFsbsh8PYU62OuMHBN6+a1zGoH0TYf8E1xju6ciSlRbw2f+RiWv+rIZnrZvIw+pTORSi
         2QXl9BMlDo+/tTbjCUxsd8HpiilyR9AuvgmMm0nCfcAuaLSbW3jA4UlZQ02Zhx0C6DLv
         1DsHAr6pKNHeMQ3+sZw+2vh8j8NcLIEHRNuB+03J3gjXOgROnVSq0pbCb1i4YJVdOVi/
         lfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581456; x=1796186256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ry895IeeCwvvoVrLKPY1qGl5vh7XehrgPQ0oBew1BlU=;
        b=XyVhc8mzEGMU9/b3ASSxhbH0/q6tQZ4WmurDfV9h0z93cEAqwLCxi8RbQPf8sk9FOk
         QvvG/f7HnGD0MPhtFI7ANkjvcgI0ZXnnYytlbwpnbHLPZw35m8qnDIbbba59Pv9Z9gs+
         q0JyfnGnQGrpyhiVfkJbxAHqgWm3RuacNfO8eGawLBI0RpweEQmlj6TrxncT+TYqi/wL
         DZRKRTKVqpyFyLd2k/FplPpjs9741Crmp6DfvbXYpFKEbcZI8cY8IB3UOBnGwvmPbuvK
         b4D3fK0/w75x4P4SIHIQaxW82MbMqGmN8QsZQezTmHvCB38ZybN74d1MMBg0sSxlv/cY
         ZpVg==
X-Forwarded-Encrypted: i=1; AL+hErEl3B1b8BRDy2IeGmW9q0wLcId8FpB+1c/7dxmWmcmCkmaTMkoLszU0GlbdMlyY6yG55CXpXT7viC4qVypQ+OKr@lists.infradead.org
X-Gm-Message-State: APuU4Z/AdRbPiySh6RCqDhH0XYi0ABnApGS112plees4E/cuConr+2qQ
	f580G1jWiXc8OS8k7B8v0FuYJDT/UdpzmJBljEhSXZIhbLjUTsrddzxN
X-Gm-Gg: AZFdTZe6KfKUjECJuqsQV3a5zj01A8NCdjMcb3AVm+SAZLR+MyJvrXpnFyxoxBfUbPi
	RVOu4bMvFapsOTagjLHUBjzohLGHYxbZadzcAWFmcdP9HGZM+VYnJY+mlIGuPiP6bjH2u/IgLra
	XftR7WKTWt5iE9l3k61TwoqXW+xicnYjCe3b1rXhNv+yTQxhuW54ytcYlBgbSsmYh4T2uoTjMHX
	R2iFiaT0hNY6XOxKPMWSVEcKj7gMO7/v1dh7rSExmnaOu+4FG2WKUj0dhT+DPyE1jWpr0v2HApZ
	c8DzmgRUutS16b2Yac6br0J2nmetPWg/qYjsiTGV24jt2y9KaY/PlsUxJfSabvaZ7WrxYM2124u
	m8EYMzpjMbOefwG/SGi3BEcqqYiS5GGjT3Qho6DeP6B3Mnu2ZRUy5L/ws3GJjHuM0bkBJyWnrA7
	XOv6Ro/7fE6HD5OA9C5KcpYvgSkm13SWdEz9RJsCemD1CF3CrbHUTDQ5+wQnt9rob3s28uqys3w
	FM+gz+yczg2WY6+C1zCUWbikxpFfvnS1TADAqMOdwPRbX/iX3VY3CcvZbP3IOv7pnCI3ZTYbTAW
	/rdLwl23xM+TQRg1cmgdPX2MLuQ=
X-Received: by 2002:a05:6a00:b92:b0:882:6d80:e5ad with SMTP id d2e1a72fcca58-8c87bcbcee9mr14392696b3a.9.1795581455547;
        Tue, 24 Nov 2026 20:37:35 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm8215994b3a.31.2026.11.24.20.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:35 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Manikandan K Pillai <mpillai@cadence.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Hans Zhang <18255117159@163.com>,
	Yao Zi <me@ziyao.cc>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 6/8] doc: phy: Document some bulk helper functions
Date: Wed, 25 Nov 2026 12:36:37 +0800
Message-ID: <20261125043639.249525-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125043639.249525-1-inochiama@gmail.com>
References: <20261125043639.249525-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_203737_639791_CA55B2EC 
X-CRM114-Status: GOOD (  21.39  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document all newly added bulk helper function, it can be used to manage
a set of PHYs automatically. This is useful when the driver want to
simplify the management of multiple PHYs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/driver-api/phy/phy.rst | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
index 0865c2e94eec..cae3d4700814 100644
--- a/Documentation/driver-api/phy/phy.rst
+++ b/Documentation/driver-api/phy/phy.rst
@@ -114,6 +114,12 @@ it. This framework provides the following APIs to get a reference to the PHY.
 	struct phy *devm_of_phy_get_by_index(struct device *dev,
 					     struct device_node *np,
 					     int index);
+	int devm_phy_bulk_get(struct device *dev, int num_phys,
+			      struct phy_bulk_data *phys);
+	int devm_phy_bulk_get_all(struct device *dev,
+				  struct phy_bulk_data **phys);
+	int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+				     struct phy_bulk_data **phys);
 
 phy_get, devm_phy_get and devm_phy_optional_get can be used to get the PHY.
 In the case of dt boot, the string arguments
@@ -129,6 +135,21 @@ Some generic drivers, such as ehci, may use multiple phys. In this case,
 devm_of_phy_get or devm_of_phy_get_by_index can be used to get a phy
 reference based on name or index.
 
+The bulk helpers are useful when a controller operates several PHYs together,
+for example the lanes of a single PCIe port. To get a set of PHYs by name,
+the driver supplies an array of ``struct phy_bulk_data`` with the ``id`` of
+each entry set to the corresponding PHY name. devm_phy_bulk_get() returns
+zero if it obtains all the requested PHYs or a negative error code on failure.
+The driver owns the array and keeps it valid until driver detach, when the
+PHY references are released.
+
+When a controller needs every PHY listed in a device node's ``phys`` property,
+devm_phy_bulk_get_all() obtains them from the controller's device node.
+devm_of_phy_bulk_get_all() does the same for an explicitly supplied device
+node. These functions return the number of PHYs listed in the node, which may
+be zero, or a negative error code on failure. They store the allocated array
+in ``*phys`` only when the return value is positive.
+
 It should be noted that NULL is a valid phy reference. All phy
 consumer calls on the NULL phy become NOPs. That is the release calls,
 the phy_init() and phy_exit() calls, and phy_power_on() and
@@ -149,6 +170,14 @@ The general order of calls should be::
     phy_exit()
     [[of_]phy_put()]
 
+After acquiring a set of PHYs with a bulk helper, the order is::
+
+    phy_bulk_init()
+    phy_bulk_power_on()
+    ...
+    phy_bulk_power_off()
+    phy_bulk_exit()
+
 Some PHY drivers may not implement :c:func:`phy_init` or :c:func:`phy_power_on`,
 but controllers should always call these functions to be compatible with other
 PHYs. Some PHYs may require :c:func:`phy_set_mode <phy_set_mode_ext>`, while
@@ -172,6 +201,12 @@ PHY framework provides 2 APIs to release a reference to the PHY.
 Both these APIs are used to release a reference to the PHY and devm_phy_put
 destroys the devres associated with this PHY.
 
+For devm_phy_bulk_get_all() and devm_of_phy_bulk_get_all(), driver detach
+releases both the PHY references and the allocated array. To release them
+earlier, use::
+
+	void devm_phy_bulk_put_all(struct device *dev, struct phy_bulk_data *phy);
+
 Destroying the PHY
 ==================
 
@@ -221,3 +256,8 @@ DeviceTree Binding
 
 The documentation for PHY dt binding can be found @
 Documentation/devicetree/bindings/phy/phy-bindings.txt
+
+Missing Bulk Helpers
+====================
+Currently, only a few bulk helper functions are added as they have users.
+Function not upstreamed can be found at https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/
-- 
2.56.1


