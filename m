Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66DB606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Tj9ZlCB;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=JRYgVPid
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t4L7StXLpSuCzJ7HmqGw9DyrOWvhNC6AF3ZLL8DlrDo=; b=0Tj9ZlCBAobnzx
	ABFD9xH2jrFbDLMDaBVnUN9kkjwmHRtMsJH9eiH1nbND7ukFLS1oOKxbJxm2TrWWLXCvqYK1ugw+O
	Vg/EGNTeitiTXn9Kd2lah07BCtRpOXrQc9OYDT1NmsXBAgEpGSYjZD8JgcTZWY6mc+iFIkRyscKL8
	ZMxMNkgirkOGowAZTPa+LvBFXqWKxO1cAj/xUxFlox5BdbsFkRKD2wwN4D0pfo1zjDgHjd6/+Lsu1
	7+wN9JYt2q1rnRoQTDU7GkHgGmDW2JIkCBsQYh/Xk7LuS7LPBbBa16xav+fcz/zbVeln4C6lMZEK8
	RDSDSj22G5tfUWPZAosg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKC0-0000000BLQS-2liD;
	Wed, 25 Nov 2026 21:06:16 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKBp-0000000BLLl-2t50
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:06:06 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 3BBBC4C96B;
	Thu, 26 Nov 2026 08:05:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795640758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t4L7StXLpSuCzJ7HmqGw9DyrOWvhNC6AF3ZLL8DlrDo=;
	b=JRYgVPidg63ejmLBt1/KYuC8Lk6HOUXOmieBIHkuWaIyM9OnqBn52d2hhhtdmbS+nJW7GL
	Pl40PF9gisyG+mIx6ZnHaCBHmv5gNHXyVjGIJuLFre5M4jITrEbLvhtiaWNQfx3aVgQWqt
	vY/t+XB1r49zKk81aUa5dnB8iAKDhJMhB8OB7P0Mwh6hxFU1W3kUPJNhQ+Q1jO4rrSqjb0
	2ps/cEuPPjwVGlvv4u5qauP430k4nMziE93SFMts4ieygNKfUZDWzUc1wR9H8RBPRBJQJV
	oeIleQjwBZ8ritfr3KqKTlfFANm56f6hLiew124p/4IxO8HdHYpvkOyiMauCGw==
X-GPT-Reason: This email is classified as legitimate, specifically
	a technical patch notification. The content is a specific hardware/software
	update ("Enable Crypto Engine") that directly aligns with the
	personal/professional mailbox of alastair@d-silva.org. The sender
	domain (d-silva.org) perfectly matches the recipient's domain
	and the signed-off identity, and there are no phishing indicators,
	urgency tactics, or suspicious links.
From: Alastair D'Silva <alastair@d-silva.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Olivia Mackall <olivia@selenic.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 4/4] arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable Crypto Engine
Date: Thu, 26 Nov 2026 08:05:32 +1100
Message-ID: <20261125210532.695823-5-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125210532.695823-1-alastair@d-silva.org>
References: <20261125210532.695823-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_130605_878667_196991C6 
X-CRM114-Status: UNSURE (   9.26  )
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

Enable the Crypto Engine TRNG on the Xunlong OrangePi 4 Pro.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
index df70967264ed..f63fe124d108 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
@@ -27,6 +27,10 @@ memory@40000000 {
 	};
 };
 
+&ce {
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_dldo1>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
-- 
2.53.0


