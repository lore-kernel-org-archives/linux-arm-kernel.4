Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0997A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 11:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uww2NQI7;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=UADWpVae
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=H0POKlXJyl1potWBMogKNasbJD7Qe/EdMAgMjh/RQek=; b=uww2NQI77s0XCTDKwzIRKM+H4a
	Ceiagk8jXHFhdqHgcW606f0clpbLYZ+uYMTJkGxzjcY8Uz+FxwwdFUS2hqgVgUXJiejBNl/m99Yf0
	mxyaBhD9DAbPiQ0KI/Q8swumEWI7mZNA9BdLWYvLZJ9bDebjnKNZVjVP0WZdyuTkpU6z9HELHK23j
	IKkXekiHIGEVlipvGpueO9MzJjIXRJ3WUuG4EhkJigP/1vJbUls2PHDhU4TfUdXj2GorsCqknK8ap
	TGActLeWuE3cR9JcNtrzzi7IOGKAwnBFEnRR1DhtDO9yP4c6SwyI3KPLNSAYy0Y2U2vxq9CLfOjAi
	T2Qch4CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjTD-0000000H6e0-1Z3Q;
	Sat, 21 Nov 2026 11:41:28 +0000
Received: from out162-62-57-64.mail.qq.com ([162.62.57.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjT2-0000000H6ZG-174F;
	Sat, 21 Nov 2026 11:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795261270; bh=H0POKlXJyl1potWBMogKNasbJD7Qe/EdMAgMjh/RQek=;
	h=From:To:Cc:Subject:Date;
	b=UADWpVaeOCWWc5JGFF1Dkfd+q0CAOwAIAfalLg+BBuOrhvfeYUKj+OyOahQuIIqxa
	 45E/P8HdlHt1cENeXlqpyk0JvcwowtejB59PBAwLHeps2hvpklxaQTC8PwZw0rrAyD
	 7UaOk9tHEPVAU7dQiVPVMrNN+qt8ZkNZE8guEcps=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id A483CACC; Sat, 21 Nov 2026 19:41:08 +0800
X-QQ-mid: xmsmtpt1795261268tij57gi7q
Message-ID: <tencent_9138CD6157C88BC2D52FE6394AF83E560208@qq.com>
X-QQ-XMAILINFO: MMvVzQSdFuTpJIeV8/5hjtQfotwkZ+jtKyfjhICSDMZIDHT1X/DYkcbH/Lia1j
	 XzXeCAPaRAu+mSZgb7XWYaWJ4aEZkHb3OGQKRr5VE13m7VPNP24J5vbBAWyRJvyaJ7bu/lTKOTyc
	 5U1neCYdoSrqPoiI4FLGrGUfhVfzXyZ/aH0laYFJ38Wx9RWIZMI9n9y9vvtWFAP0j6g/aTM191xf
	 bA6tWzdJK/yJunxXgLqTi/DF/5/D1kC+9mhQl17MIzNjkdxEU0pmELe05j1///XzD4iGUcEqg1nU
	 2ShEWEjwQQ7zWM5FBemnfpXWCn3a3yjz4NXFfWoddtgY8jBlpymIB+EirySYqXEu0j/PU3gC3qn4
	 2L2t/Y207YshOdI0SSUjVMQ4UzGDNfPf0zktGGM8vE0KvlgIqHr500j6wZSeMHUHSUI5YBpkEqLh
	 8hSBlIiZDuEBRbtMbn2Q4u/3VhwyS1wiRTp+qp+ZAKp5K31uec3cPs50VDhFzu8dkLRQkjM+nc7O
	 2PP0PdS+XqL7bXk34rye5nYJzEHXeIyeFn4V91eDFgna9Ao65Xi6ktbGr4ddRdOmgLq85Ji5O84k
	 AEdncFZHbJ/dTwuI1srplAWPy5in07fMLejYV14KxZMKXldi2Q5h0m9vYAdtYdc05AIRG0UTLIXk
	 XVPN6NWcFQ1Y5IuqFQ6UPswh/QzJry9LF3z0nmP5DMR4tIdiqMMpi7I/0tBAncU+kaGvHJWp36rs
	 Yvj8cCJzQqdJZpZQCMKfnBWmJGuxYFlYplciUPPRUpKWp1FfhbsKevW6nm7Sa2Ew2EoT7Yg4Y7nQ
	 S4yPD9ipjb277N0KxNT5dOdVvyRLcxYEcVFW3UmLoi6MP2EUvGl+3ZNkRMNDC6Gt/JBOw/D2/FxU
	 VWjb2N0QFbtq2XrLNi2H2kcH+S9XZ6JytvhonJoGtOnIISj/+cl1V6FuQ/ygiqXtpkwKb+xSClVc
	 LUZ39jg3zvhE52KJynxzHQ0GH3RmzBxZJGlX8Db2EhOxOY3SvjLOKS2dz5bySvKfW7Z9w0+y2/b/
	 iTjzddXsotbsoiVJ+E2mMjYA+ISe9CkTp8ixrHmfB9UE6oerdHByOstz7quGpbE5/Lb0JuIEL6eD
	 JCQlW6e1n33ePa1d8K97hBp3TwZA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: ZhuXiangyu <1194781887@qq.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH 1/2] dt-bindings: clock: rockchip,rk3506-cru: add SAI MCLK output IDs
Date: Sat, 21 Nov 2026 19:41:05 +0800
X-OQ-MSGID: <20261121114106.1464639-1-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_034116_824356_44B20AD6 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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

Add clock IDs for the SAI MCLK output gates in the RK3506 PMU and
system GRFs so they can be registered by the CRU driver.

Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 include/dt-bindings/clock/rockchip,rk3506-cru.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3506-cru.h b/include/dt-bindings/clock/rockchip,rk3506-cru.h
index 71d7dda2..708502db 100644
--- a/include/dt-bindings/clock/rockchip,rk3506-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3506-cru.h
@@ -281,5 +281,9 @@
 #define CLK_V0PLL_REF			268
 #define CLK_V1PLL_REF			269
 #define CLK_32K_FRAC_MUX		270
+#define MCLK_OUT_SAI0_TO_IO		271
+#define MCLK_OUT_SAI1_TO_IO		272
+#define MCLK_OUT_SAI2_TO_IO		273
+#define MCLK_OUT_SAI3_TO_IO		274
 
 #endif
-- 
2.47.3


