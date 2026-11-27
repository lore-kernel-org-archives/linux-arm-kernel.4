Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62E7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1rqnMNex;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=BjMGwce9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sUGpOschMgKcNOmhpOl6DU1Uf2oJ2iJXfUMTPyLb7GY=; b=1rqnMNexO65px6
	J3mumsAytJx+3aCd3wvrgkKnE1LmQQu93AsAF7tklK+YVhDFleuVaShJA/8BqtKPs9LaP6QBClxA2
	AzjM2F9iTeEBgPHjinV40yjRShuNqhQjALtAVmDQh+pkLQZE5+0JYyCQBjxEXhzEpX/eOG9Iure43
	KJZgLoHlOQ1q6J9SOyt6zW1mMjcDpWXzuTowEpxy440oNiopuLrPi/3/GtgybgBc+9rp0O3KErunM
	Iu0XZuRH+vcIOrgGl/kfhhEnT9RJuTN9xzKwCFATcuYmcSi91C5gOfMfcM3336LHfIXm6JEl6M1XU
	4MHHqczc83EbkgR4OJIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqSH-0000000F7Zj-2bAc;
	Fri, 27 Nov 2026 07:33:13 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqS8-0000000F7UU-2vVJ;
	Fri, 27 Nov 2026 07:33:05 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id BEEB44C966;
	Fri, 27 Nov 2026 18:32:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUGpOschMgKcNOmhpOl6DU1Uf2oJ2iJXfUMTPyLb7GY=;
	b=BjMGwce9c3BvKfzqymvhn5IZjfMvWIs0nrdnoDN0PEwrDh+iYxBSnqSygFsj5ZBs/RnyjA
	PimBAaSzQCc5mM9+Rp68anzdoDnw2QdRLR/+5MRfT9uAAgupa3jEzdB3416o6od4fPiLB6
	ESwvZPemGUx/21TwGIRwJpCGCBkNeVflB/ZPYCBS0noKJvWwtB3mNi/Xypp7TXbNYl36Vj
	Bkg72jrbW7pN3IkIY3Ibm0i3C+goi2tzP7Qs4ATSmhsGfu4CM7pfQfFI+RfXClylLlpd3G
	yHdSfO8ORCmUbxiRE0FOztwpb3Uy95VAQptJKGPkDDUFDzM5z9cUH1cq9Fcyqg==
X-GPT-Reason: This is a legitimate technical communication. The
	email is classified as personal/professional correspondence because
	the sender (alastair@d-silva.org) perfectly matches the intended
	recipient mailbox (alastair@d-silva.org). The content describes
	a technical patch for "dt-bindings: clock," which is consistent
	with a developer workflow, and there are no phishing indicators,
	urgent scare tactics, or suspicious links.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 03/11] dt-bindings: clock: sun60i-a733: Add USB2 bus and sys clock IDs
Date: Fri, 27 Nov 2026 18:32:23 +1100
Message-ID: <20261127073231.1776847-4-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_233304_896319_CE9EA737 
X-CRM114-Status: UNSURE (   8.15  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Define CLK_BUS_USB2 and CLK_USB2_SYS for the A733 CCU.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 include/dt-bindings/clock/allwinner,sun60i-a733-ccu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/allwinner,sun60i-a733-ccu.h b/include/dt-bindings/clock/allwinner,sun60i-a733-ccu.h
index 81924cba58ec..1e751cfd75e3 100644
--- a/include/dt-bindings/clock/allwinner,sun60i-a733-ccu.h
+++ b/include/dt-bindings/clock/allwinner,sun60i-a733-ccu.h
@@ -287,5 +287,7 @@
 #define CLK_FANOUT1		274
 #define CLK_FANOUT2		275
 #define CLK_FANOUT3		276
+#define CLK_BUS_USB2		277
+#define CLK_USB2_SYS		278
 
 #endif /* _DT_BINDINGS_CLK_ALLWINNER_SUN60I_A733_CCU_H_ */
-- 
2.53.0


