Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE628606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 00:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=quROMo9Z;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=gwQRCdz5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Quk+i+RLhvm+ITRHRSHRS993N/vU6wVhQmtQekP7shc=; b=quROMo9Z5/CenQ
	dkVwLEVfQprr2BzDSlJFv94me9CYy9dU8NaQSNB8tvXhRSrn7FBLerHepjOeMLXHFQxv3j+HMUcip
	Wcopu7gSBgv+0PaNEp4sy0hlLmKpnRLwo9axRAeywyM32RkVOJvatEItjTzhe2v0H4CgWkyiE+N13
	UMJrQ8nq7EEVIMeWZICMtKoZJr+wwLVGHhwj+coVDPbPGRTh8S6lUZlNsUJuargErS0FAIXHehY9X
	Bo8ofGecCBG0IlMAjnzG9Qss0fypTE5o0QKf2VBOWpHScaJpoO2iqKNP8uaTbIVq3r5gIlckmt2hO
	QM9+GlYBo6Ck02pT4cKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVI53-00000001yi6-3O9P;
	Mon, 23 Nov 2026 00:38:49 +0000
Received: from out203-205-221-235.mail.qq.com ([203.205.221.235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVI50-00000001yfL-3Zel;
	Mon, 23 Nov 2026 00:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795394324; bh=Quk+i+RLhvm+ITRHRSHRS993N/vU6wVhQmtQekP7shc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gwQRCdz5TLOlZvOs1+mTn0EQGSKJ71FPPa4BO6q0OR1JcxgFaIAczMN6jbnheEl4L
	 L4udtxrTuKwX1nG7HTKmL+evfKTyfwIc8JWNZCJQbnOGfuk5WpzRXjR2ejH6Nf5jM9
	 LNkbcjU4y9ObkmujXUPs8553x9hBQA50ozRscox8=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 9A63524B; Mon, 23 Nov 2026 08:38:38 +0800
X-QQ-mid: xmsmtpt1795394321tibpj7gpb
Message-ID: <tencent_6A1DF318251B1F7D01E6E6B8AB9A45E3EA07@qq.com>
X-QQ-XMAILINFO: NM1flO+R30QG4TXeUNfdyw7rjdk2yIB6EJ7b8AMe5egQjr2bORbeQ8x2zjIIia
	 5J1XD6joABVL4+vdbW2sZE6WV/tf8b5ecZYkORPUslR9ESaCxZdmVmm1tKVQdHWrflRvoA+yec6B
	 tf/yosJwDMKAMwlurLlNlZhg8+uur2cVHF5D1juqOm/adSBRg6Y5xC6soj8FY5O8aufKUrLoETsV
	 i4XhB4pwt6vf5LaQiiFdZOxLI7kQzBW6i/JZUmQqzzYVeKcr8nW8IRoTTsIntoZ2YIdvmVtIwdA+
	 Y9ms3aa8cXi60tYAkmFvKMQWS3sZIy3KmOLWeTtqnrzl7OHOElr/NFl8ExOZAB3c7xCtvUOph8aZ
	 zla1/ZJdffc17UA00LQq1xo/zpfj4re0VayHNQdM0fxpzl5ZB/q0+bU9X7CGMzEXabNIFcBhfWX9
	 w4WxbWsD2mRnjHy61zzgVrlTErdLwW6wSipS1hwsjSvBFTez5I1jXyl1/bRormo+XlTt0rQLxRA+
	 MbZCXHRrJ0/mKxzVZAEBNke7yCddSuXKItRhZjJNN8NeO3XOqgmYDiX0EFu3QgKvQlql36fia+nm
	 AtzEQVRf8jIzpk0EnInqdq52kIkvpHP58UZ1EslGuRthqXxxE464S5gOGTILtMZ39yKmZ365gRcI
	 WqkReuNFG/J/2erwQUoPajbs6WsJQSsECR6X4JIiFOPRmB6hUUlWvRR8S9347rDEYTFAcGwr7jUE
	 llfcEyO0okqXdpzkBgipoWDzDh89UW5YXXbZWIg8SoAY8e2Rg/JPvRSLz6W0gbW591EBMyMatwOM
	 HxzfYVH0mqV1UaNVp9KcM/JI0SOmYSpVnPmdBB2g0YpzTdEF1NwR5HF1seLALfOsCcTG26r8yocY
	 qadZiVhcYwRbBvMKuBoIxnjM67Srx6g/yxzMGtq0QNxRHomGmJGnGMKJ9N7acM0YP/gqBtlKoqED
	 Kih5JEs1kboOkk6He1ZAtAiqB4agv7iIXiLcMx0ke297spHuiBPb9hvPhfclQCIj2HSHiLaLarKb
	 CJEATIhGS2E4zWPxBNg0GakQZ9yoEo5jBFeKFJWScvMuhzQ590bxBVsrikKITeo5CyRth23mj1+P
	 fkLz7Q5xbs71Et7GwSr2B7S4I5HMfIe9Fsa08C3UEiSDruAziQqSYAgnWAGSJXyh9OaeJ8b8NGbl
	 bbBrQFW/RBLwMpWWUq0Z/+lbjmzfp30UiYFXPrj7chPW7AW7FcO7Z7JlG3yyXYmICYA2IFP/0E8G
	 VmkA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Xiangyu Zhu <1194781887@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Xiangyu Zhu <1194781887@qq.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] dt-bindings: clock: rockchip,rk3506-cru: Add SAI MCLK output gate IDs
Date: Mon, 23 Nov 2026 08:38:35 +0800
X-OQ-MSGID: <1d48a3116456de6a3f236aa852fa99a515a4b7e3.1795394137.git.1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795394137.git.1194781887@qq.com>
References: <cover.1795394137.git.1194781887@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_163847_349610_13433BC0 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Add clock IDs for the four SAI MCLK output-to-IO gates of the RK3506.
SAI0 and SAI1 are controlled by bits in the PMU GRF, SAI2 and SAI3 by
bits in the system GRF.

Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
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


