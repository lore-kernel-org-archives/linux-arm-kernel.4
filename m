Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE54606A682
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 11:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=asycUZ17;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hG4tA7U1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z4JW42X5iD/lJnTftpanyIMbBetfqY4zpOSQ2Qgitb0=; b=asycUZ17j/XocN3HVFxxWjjAtg
	khYV2d3YH1JJSb7IuRHD+KpnTJfsgwzjvSgkPRYVa7pVnMKpQ4YFWUN/NuurSIzbDmGc0MHJVRIPV
	Ve+fqBVXuuVBwx33SPHTC8CBxd5OwvoZ5ICpQxFSMroWZL7lPPs9Usm97COHnibt5ZuKsvfQ2VPKj
	XtsV4es07go+HXwuHBOPsHulEYx/J+azf8DUuL1PqP6sRQ6Q24wHMqFOqfscwZD7Y3N5t40JcvCzF
	AGSmpnRuHcbuyZYo9teiglwP+azIS52u6Dm5SBDK7Y0oYi02gqX87/C/n9l+B1dQOFtthn0PDNnx5
	CG1vzaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjWK-0000000H7Am-2d08;
	Sat, 21 Nov 2026 11:44:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjWJ-0000000H7AL-1MGu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 11:44:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D336242270;
	Sat, 21 Nov 2026 11:44:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795261478;
	b=uALm5KJzgwKrsxj86Ewd/BB/PPu43Ym+ybdgqF9u2lpeekfM6hqfMFRukwqrS9O1/EGc
	 JfYX50Vgy8NL0yxucpkoIwdsQA9HtIrk4JLVOLnbn7Z5BHTXCGmkb7f9JpeCbKcyxCMe3
	 SeG6GfIkOHaoxYQXuvCigNY6cvEO2cpL7p9MdwGWZ+pVPgekXG8BJ+l1ojYEzyE48q0Dw
	 QELrY/9Ud+8r0lgtufjQwkisLm65v/7oQbRq+H6gqlsyg95YJU+IfQ+lMGbQAppBeLqm2
	 tGluVppbVCEiVKCaRIG+eaZKQTt1ZZGId7ew+6+XDPvg43Z/lmA3Ag9QBY/hH8xFe/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795261478;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=z4JW42X5iD/lJnTftpanyIMbBetfqY4zpOSQ2Qgitb0=;
	b=vwVbYFNSRwo+upsboOGlJG04bJI6++GkrKGurmGvP0irCYcEvp49gCQkQKHvTiXDlqgC
	 OuwHNlIxlWcubL4zZgRoDYQLTaxZtn2ks2Ayfppap9v6xBrf9TfB+qVhZ8o26WKNWMuEc
	 xXDeUaUYLPCJ/Rc12EhqndXDXyWxNptzwfBsYuL3/BqZRCt99clfZLgKspNUkemQJ3y5H
	 14FqNUe6/vBRdv7w4+PoPyeNDyFJ7V1sE13aE6HeWVhFg42e5O6+FNjdQ4bIHuZ8E76fa
	 T+UJu0ypW9s7YDWNJ2iPHRGDWx2Kmqgt4CKRz/5TEyysFCo3CPTzlLuI3HOJfZUW2BQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23DC01F000C0;
	Sat, 21 Nov 2026 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795261478;
	bh=z4JW42X5iD/lJnTftpanyIMbBetfqY4zpOSQ2Qgitb0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hG4tA7U1XjdRNvjqIJ/tmZM3DlC4dWUbfdq++1JCKQBQMzpbzjrFPd9SzT3td3gDv
	 Hjzc9ySt2v1WSXqaSoFmmPxfQn9K9WJVYkcqGTPe0vQ/AhKyBwWzzM4QM/f9SKavSo
	 Szphjdd8pRwupXo9pHkElWoLBO+XTn2JQ74d6K5kVkB+B8wxE0VcwA37BlqrKn/R+v
	 C2S7+K+4FEJ6dd8OFW7VQ1TpInHpqIR8UBNPx0cLeMbdppmhDcLccmVX4aNf/l8+wm
	 Sa2nJohzWcO6aTeYnUWNgECYR9Sf85+k807BSuRKc3va+K1LwbavaWfLAraIUQjQNS
	 Ij8qxiE5sATbA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8EAAC4BC0F;
	Sat, 21 Nov 2026 11:44:37 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 11:42:46 +0000
Subject: [PATCH 1/4] dt-bindings: cpufreq: apple,cluster-cpufreq: Add M3
 family compatibles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-m3-cpufreq-opp-v1-1-42a0c07c48a4@gmail.com>
References: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com>
In-Reply-To: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795261476; l=1356;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=+HvmgCEavFBOajIqGH23VOYZLXgPd/UuvSVcHqeHPKw=;
 b=HljbQapLWB7r5SkMx2ZT1MQOvMAUVgBZEuBpZJ8vSJSusfQ4dKa1q873lhCb4troGRZzZnRTk
 +qOmoZ1FalRDcEDSgBZ14cbXYFifDp3Mhs4BtnjYhnJV/O9eTN5Xyau
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=ykwkLcuByJYb/cdLc2UuoYP03pIzwrscEZg30+4tJL8=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20261107
 with auth_id=1442
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michael Reeves <michael.reeves077@gmail.com>

Add compatible strings for the Apple M3 family cluster cpufreq
controllers:

- apple,t8122-cluster-cpufreq (M3)
- apple,t6030-cluster-cpufreq (M3 Pro)
- apple,t6031-cluster-cpufreq (M3 Max / M3 Ultra)

All three are compatible with the M2 (T8112) cluster cpufreq controller
and fall back to "apple,t8112-cluster-cpufreq".

Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 .../devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
index b51913a81791..516216cb6ad6 100644
--- a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
@@ -36,7 +36,11 @@ properties:
           - const: apple,s5l8960x-cluster-cpufreq
       - const: apple,s5l8960x-cluster-cpufreq
       - items:
-          - const: apple,t6020-cluster-cpufreq
+          - enum:
+              - apple,t6020-cluster-cpufreq
+              - apple,t6030-cluster-cpufreq
+              - apple,t6031-cluster-cpufreq
+              - apple,t8122-cluster-cpufreq
           - const: apple,t8112-cluster-cpufreq
 
   reg:

-- 
2.56.0



