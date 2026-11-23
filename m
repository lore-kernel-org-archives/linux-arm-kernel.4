Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2321606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LQ3ZG99j;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dt0SyDlZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D7n2/qCgQ97P8irJRGu6nB1i5LmlSzAkmpMLJB2fKMs=; b=LQ3ZG99jS0VkVzWHuxY8nUBYjC
	XoHcKRBugENDLUHznwMxmLcyNAU+GKpbPwWTA8MmuLZTUou33iYk81oXgGoUA70dlBnDyoyV236Xh
	c7y5Wbtt6xqCsuG8rozYq2WoblRMOhZHzWbk+07pfpzmj6J7ULaLxPNbxPFstPwwtuwvU/zgShuRs
	5ZwnXU3Mse6rq7e3j1uUrQ61axY8yubR9Yr3dElXQ4Yrhlnbo8h2hqvs9b7gMQeM3yxRH3KeCJj1F
	mj5peJbXFopJS8h4FpKKH9L775cc59Z9ct6LhnGAwflwnw4EpAoLyqXRpbPRBSlapn2RRvp0ovg/M
	3H09lfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVeA-00000003twF-3oMs;
	Mon, 23 Nov 2026 15:07:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVe8-00000003tvE-196b;
	Mon, 23 Nov 2026 15:07:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D4D8245665;
	Mon, 23 Nov 2026 15:07:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795446475;
	b=wLHnKX87RoRWquyCT7fCNgRJ6FzHR/hDG1iyTDkaqQk4Z8LA3xPLQ9BcUAFUU/zmspeG
	 bbqQlVJasRQ7DyzStqGibVHAcBs8hpf1X6rsHbnjhahkHanZjmxQ1zQpr5uSYgKeT6n4V
	 FBy7XkWxN8bdCB7p5z4K1eXsNOm+/B0NWfDdgPWWuqQ2ZcjadZjU1sdZRxmgw4ph+R+hd
	 qmeJJn57/w9qZRvNNrbXDr2saMQ2LKjWOVNsqZS8qt1vU9GeyV7PmFqU170cXx2+b2brr
	 xgl8X+Vk08z/zaOJn71WaglZbwr8oWaozcARFXrRKi6ffVQVcPRtNDp6J69VmIvCYyQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795446475;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=D7n2/qCgQ97P8irJRGu6nB1i5LmlSzAkmpMLJB2fKMs=;
	b=YE1ktghMfHfUeREEs9+bX9zQcdFn57swNZW9JIVOz0P/ZHvH7r49Gn49g0d01iFGfpgX
	 4R/EowKk6kd7PhjGhWkoJFJiEUk2baikh0QXm9F8KyOnGSOxw9VGbwWW66uIDki729Bfc
	 UELPHh9ZVpp4j9NvO7te7Nmxn+EwsPcURCYfCaOiw0eXyTPJupYrBxM0t4z1w42V9C5Vo
	 +8vGCPdueh+oNEoboXp7vNY+Uq63t0c20leb0bGBe0OIbmcwXCxiAJR8ciF7RBIX2TbPW
	 bPiKIcWveU0NbwgDOZ/qqlFhFjUI6RuWSbAj+3uj2krSdyINrzcfa9iImzVS8F3o/GA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 307071F000C6;
	Mon, 23 Nov 2026 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446475;
	bh=D7n2/qCgQ97P8irJRGu6nB1i5LmlSzAkmpMLJB2fKMs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Dt0SyDlZ5gYQUUWRD/obLZHt+TyncayVIhYvKW75Rejr58hnfZyo9B9BsrcZfus9a
	 QvsS9jnrwmeP2RLSHWMlwf1xJa/pgXrcWfBX0v+5jJTNa/Fmba3i4OGBWuhOyJ8iuT
	 ymAWB0z6NqN3VmT1+KJXtFsdl95q1+DfWSWGJqTszDkSTXdyaCh4X5a2m2qwgiz67+
	 UMLBfacdIKQa4d1LP0TJc9os+7rD1NuBit/Wf4vy+NW9YsKTEDPxXv88oYn6fVMn9o
	 1p8md3jCjmYnzayJ9flXjL1d7Fz7Cni6ab927soD7BElSn266GZJqA1jYJJaFe3J0r
	 +pd8/en1GqmBQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AEEF84C51F;
	Mon, 23 Nov 2026 15:07:37 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Mon, 23 Nov 2026 16:07:26 +0100
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Mekotronics
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-rk3588-mekotronics-r58x-pro-v2-1-2a3430cf5f88@pardini.net>
References: <20261123-rk3588-mekotronics-r58x-pro-v2-0-2a3430cf5f88@pardini.net>
In-Reply-To: <20261123-rk3588-mekotronics-r58x-pro-v2-0-2a3430cf5f88@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=ricardo@pardini.net;
 h=from:subject:message-id;
 bh=rwVu4BEUHXmVQV5ANdnCfqg9lM0S+d24Qc9S/0M6UCA=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBrBFa3XDcIt+WFnK50QuZukoPzIntotu1ZUjx2v
 yLPh3oaeASJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCawRWtwAKCRA7Xj/jnsft
 6TgrCAChyeJsZMoPikMtXVSXeLalam5+o87nQLM6WlkednG5DyKmDPVwymGVm9E/BuNnrH+IvsT
 NgcycoMjIUTSp73GnCuL7atyz8Fu+m/DUQTnGmb6timH6CAISmEQlyqz/1lbCelLKYx32FEy+zb
 rP3ffrybSksv8xA/fLxoApZvuE5gVBEdJppQecFg8zmg6y2Jd72xJg3M/9y0JMVS8knpIH+pAmY
 XjuRC2xn578EZw4ZttfgeJgSSeV2Lh/yQ5cUYSgV3dgTePJH9M0GztmMtqP7SVvoJhgKsB9z7zC
 nHpSjtNCnzgJeeAd5p8PthqoLnXf+jI+eJNGwSyuBNVNKHAF
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ricardo Pardini <ricardo@pardini.net>

Mekotronics is a Chinese manufacturer of industrial mini PCs and
single board computers based on Rockchip SoCs.

Link: https://www.mekotronics.com
Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f10..ddf06858856d4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1067,6 +1067,8 @@ patternProperties:
     description: Medion AG
   "^megachips,.*":
     description: MegaChips
+  "^mekotronics,.*":
+    description: Mekotronics Co., Ltd.
   "^mele,.*":
     description: Shenzhen MeLE Digital Technology Ltd.
   "^melexis,.*":

-- 
2.47.3



