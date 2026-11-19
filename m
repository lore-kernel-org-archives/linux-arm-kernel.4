Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED86E606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mkhPYFcp;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=kS+IJVHn;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=Usn00CEY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TAlM5jTVZrM+XUfMxfpCUHKgs3VRnpzXKI3CImjcnWE=; b=mkhPYFcpClRIK/
	q424swfLmYuGPRVKzGCBTemWb1Pwn6BAb9LDea48HfBqUBE7JrE6bKMRfcV5IK192Z3/roOMVhxxE
	HDbGezHrwJiv8bED4gXR9zjlAjA/ZrxCIN5dlFrbaYxc8E5sVrncjQLesln4IpXEJyL5S4hmF4fmh
	BCWWK0aUVVC8MjGlq2tpHLuNYL/3f5QCv2bVKKp0VjbRH7BweO4jVkLIGtmRxmilg28rj/g//lWc2
	KtwGFOLz8ztRAFqNIUbeOTNCAIfnaaHsjzmJRK/zSRby3HSucWFhcZ53XO97X4RekzXQpjsAytXKb
	Jnb8NawGRe7AL6vASkTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3xB-0000000CPwb-1nO9;
	Thu, 19 Nov 2026 15:21:37 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3ws-0000000CPcn-1vrc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795101677;
 bh=TAlM5jTVZrM+XUfMxfpCUHKgs3VRnpzXKI3CImjcnWE=;
 b=kS+IJVHnqvY9+wObki5RzSVCoEUxa4dbEdukgo7Bzvkhr8Ng44A9Lli7b9l39u8W1ieETYCgs
 mBOojmqy0aXopInB1JjAXrc+sem7xrg1KQTTKE3vCmQzWy5Lzx4UVGL/lNn6v/g8Gl7erL41Qt7
 cBhNppzeHJDixe0eZ5J4tE5wByG/8LYUBbXLePAX7H4zsuTholEebjzRtmT8idh5MV9oYKFbIQF
 m+MSlOfDoHWCABi+pxudqAa97CqkIhjsmzC/j++UYnn1fJxC0+Dt6rdDy7zegYf4FdqxDV++OAK
 7Ri/Y/yiGqMsIoz2oziIxgMCvlhkVuBi/l+5i5RAiM6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795101677;
 bh=TAlM5jTVZrM+XUfMxfpCUHKgs3VRnpzXKI3CImjcnWE=;
 b=Usn00CEYe/2fEeX7e84Bhe57b0BYwTLYRNsUW+HXt3T5AaWoAL8iOCWQ/u9n7FIwZcZgC5BWP
 IenN5Ls24Fk5gGdHYbFh1+mCfaBeh78LeNTzo7tIetj9amxq+lc+MHPMq5O83Nx76BL8eaO3Nn2
 fAYIr9fiIzJgVm5S6n7xJck=
CFBL-Feedback-ID: 6aff13ed83f3cb488062bab9:4c81b50846e028b8ccfa75098b192798
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff13ed83f3cb488062bab9
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
Subject: [PATCH 5/8] dt-bindings: arm: rockchip: Add Luckfox Lyra Ultra
Date: Thu, 19 Nov 2026 15:20:48 +0000
Message-ID: <20261119152055.556266-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119152055.556266-1-jonas@kwiboo.se>
References: <20261119152055.556266-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_072118_558241_2D1FF97B 
X-CRM114-Status: UNSURE (   9.43  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Luckfox Lyra Ultra is powered by the Rockchip RK3506B SoC, which
integrates three Cortex-A7 cores and one Cortex-M0 core. It includes
512 MB of DDR3 memory, 8 GB of eMMC storage, MIPI DSI, Ethernet, and
IO expansion interfaces.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
As mentioned in cover letter, unclear if this should use
rockchip,rk3506b instead of rockchip,rk3506.
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 37321e23b087..651da02cfa51 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -865,6 +865,7 @@ properties:
           - enum:
               - luckfox,lyra
               - luckfox,lyra-plus
+              - luckfox,lyra-ultra
           - const: rockchip,rk3506
 
       - description: Lunzn FastRhino R66S / R68S
-- 
2.56.1


