Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D28606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uju+Wnrw;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=tqIjfMxE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Quk+i+RLhvm+ITRHRSHRS993N/vU6wVhQmtQekP7shc=; b=Uju+WnrwrdL8Nn
	W53VOXsmdwg+RdptI5ot5MBMcfrNSv42qZt/g0E0cuyj9Xdw3svrUws9flSSg+sVgZt2nsrGSjd9t
	jiqhHCJHWuDaydaIlUR69j093144CbUsXacDFUqr4H+P8WODHJ7ZfZA9khsQepyqihBx+N+I5OBF2
	H2q4ZUDl2pwUlqUYT9O0td4oh5HbmvIh5aHhncf9q7KKMqcWY6nBFv5FUZ54LcribR6OGViQk9c78
	bviPyzi5q0xh5BaatoMxE7T+MGGEuov78jpUtXaYhR149rKHoweQRB02wZVBed03JUoMIiyUg+gjL
	IfSwAB0dcxOopEmf0/7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVANR-00000001LU1-0kWj;
	Sun, 22 Nov 2026 16:25:17 +0000
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVANN-00000001LS5-022V;
	Sun, 22 Nov 2026 16:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795364704; bh=Quk+i+RLhvm+ITRHRSHRS993N/vU6wVhQmtQekP7shc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tqIjfMxEbey3ZTSH0VXE/dgT8KvyEvN9WlG3OGJzVcwA4Re1TK95DWpcfvae5nGqS
	 +F3EMTPSIyXDaIvqw5xCPaWQaACDU85tgXD9Bx/BqdmchT2u8PL6ppgUS/dZnhEh01
	 JztLiPFQr1863HCMI+hsxEqwfvgTafffXr8X7L6U=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 640042D7; Mon, 23 Nov 2026 00:25:00 +0800
X-QQ-mid: xmsmtpt1795364701tbdj3154j
Message-ID: <tencent_93FC4A7191B1BAC63C4DE9C2674660AA7905@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoeurQk+2RpOXQFHYlkNOJY/sjHlDSZGHJ97j+R4SUYeYhyX8atOZ
	 TgW8xfJE6d5YNTTM8+5XaDELGGrc4QZlS7OdRmqhU0qmfQycfaqDUsAk5iWSzig7UoIs05GHLzHy
	 sIKv4uX1rdeXJu46VFD07Ld500EmYQsHU0UvXpUOn16s11Yhp+9hmFT6OEz06CTa9/aqJpSC7jNX
	 BkH/PZTrKNysm3H2hVW2VlVUKVfT7ZlwdH71rtkKLbbyGwEdAbhluR6If84caQk+U9E8ut1MJBZh
	 1dMhtzGgyIFY63ZzQ0MaZ7XdRQcuqTO+5WA5aTGBA6R+CSIXfvLALvhIa38OfMv23EPlysq15IAG
	 MBxVJqcWgdrTr/iMkpzmtSL4C0t4jcu7lY9nkJgcHrwVSUxHCpa9nE3RK1oTKc6xYbcu3eqs9tJp
	 a7tCC1hdp2TcmS+r0oMovjKsGhc/fDpFrhJY12F5hrZwQ33L2wWLSIs97nyZXY3B5HDcRNK9V1im
	 MwmRPbPA6A3AxDRlNpsG/owuM6Et8v8naI4BKg0iWvq02PLV8VB5n9lwpxFGCsWKO7/ExfSsrRGA
	 zOTswc9f3zbWyn+gMCAN0UhalaNwWP4eDZ0OjNH6aQqC+Tjxeus6wIAmeufDcdaVGNlJfHWduicv
	 xlnM4uPkPoAa8jqiTXMDuYn53Gj71S/gQNs8B6/2MsuECprpaNNrKGyL7qQn2jbCLXlMaqSbkJsI
	 /bkE1JPmkkJO3lPUZIC8y7/hBHHZOD5eIUVU1Y1GwpsQNmgIosJsp4vS1bTEk/y9fjyxIGTSIAgT
	 HMISceI7WRCrG1MgNYLVcEVlksKQW5Mi0rpL8waniYdMs+18yb7C+cpwxs4Dmk11iMFUTwxibHTa
	 VBs041pBdrfV6LTP5lvGjVtPditl1kmxMsyDER3D2Dds9z257a12ypiR+T/2YqWGgrSZWquy2GD8
	 ZGq8S98/wqZ3bg6IG9a+YJ1BUuxeWyr0AB5VINSwWUR9d6FRGmzMyYSLQVo3k0/Mzgbk+fVWpx51
	 JDMPbaiRmheobmmI7Z3cwP6PEzSdVoOm+O5a1puTaYgOjense5NdkCTuG2/+tduHolIHpBQsG6ci
	 JAn8zHXcC4Takj5Ehcbd31SWITpJMA9qAOeApV7crIZwTvOaa4T8gmUdszssXK5HP5yhxFKxJK8r
	 SrHjAD/Aog3uCUfQ==
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
Subject: [PATCH v2 1/2] dt-bindings: clock: rockchip,rk3506-cru: Add SAI MCLK output gate IDs
Date: Mon, 23 Nov 2026 00:24:45 +0800
X-OQ-MSGID: <3d57f149a33d6746224ecbb235e3b1e6f29890a1.1795363509.git.1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795363509.git.1194781887@qq.com>
References: <cover.1795363509.git.1194781887@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_082514_960783_BDFC6D5A 
X-CRM114-Status: UNSURE (   7.62  )
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


