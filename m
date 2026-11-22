Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB7C60A2603
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 00:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=awrmX5sT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X86+OiFx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z4JW42X5iD/lJnTftpanyIMbBetfqY4zpOSQ2Qgitb0=; b=awrmX5sTJN7AT8F32Og7K4Eyn5
	YMTYnJLBTbPb/dwl4dvyXGsPA0GUilfu4qRIfppWtcmJI+SFCnbuQHYjAvdkx2Q2gAoytcBbQwXU3
	nQZVOeQw0iWyg3KceD3qU9nl7RLbl5T1KImeBmQF5qPAqH1xaUdvet+1q71PIZ8Hu80QukZPZT7rZ
	A1VIfFJDExOd6D2U4mKgBmc37sY9lzY72ox21gxcH2u/I7VtS//1r42Is3tN8bFJNtMFKn7llyj4X
	VZfxiWj62vfHOB6z4phBKayw8v+Whyk53RORQyIgHw0LSCIHDca+JdQO1YHFVJ0jjx6VIan+lEIOy
	cFH0XDYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvHy-00000000ZNg-0Ydr;
	Sun, 22 Nov 2026 00:18:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvHw-00000000ZNE-1jpS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 00:18:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CD8CC457F6;
	Sun, 22 Nov 2026 00:18:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795306715;
	b=d3ZQ+ipZIN4EcF8oSztDtYSTN7AIYEHp1pbmEt2pw6lyOdIZQPH4jkznP14f9pfs/Z0x
	 aFgPnG0mgZa09CkSvYluRLbMxU5CYjjNQIyPuYCA3CaWxIZ+BFM/Jl+NmQA8BJ9V+dG0s
	 AnrwXEMHWFHCaANH3gTtbY09hVwIjLAGqfokUHQ/zFK+UmANqug9zY3mCoJazp1CZ4VlQ
	 E7d9POyRC3W+3r5iR9qz8FngwBop0L1E3qBaIo/QFCxGdZMBkc7WnEYACk+BPG/6L/Hfq
	 p08TUqvsjW0QCSeuVLRvGD+v7DzOu6HBv3BlzkkUTCs9rejrXT/eOZpSzg2TjltjnEA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795306715;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=z4JW42X5iD/lJnTftpanyIMbBetfqY4zpOSQ2Qgitb0=;
	b=0hNb3D3O9tKRBPX9PFRZQ4K6URV9/hTmej/9dzGvL7miWFhBUwkkHWDhM7yk9iGLRmxB
	 kE5lxlYYLtS69ODpyb3f9dRu936Aeq0R4CCiXaCmlvccKziDpUa4GXaJlwzIwDwIGtkT7
	 CV5qodEDBYMkqkjYGSpk+9I55+5PHaGiGNQiexWlAMRq2HBt0/n65dJl17k6TsB0jZXnX
	 SRDD9KQnqZnSN+iFUWXm4pIPqK2SizmW/ZMFQEZb3N7VvHKy34lPuGNwzUxdN63natvV0
	 10EB7n2q/LoAyt5xsttVfqyBHkHTE5LiOFGh5hL0TwLk/j0xMZ5Lz0jUmGb+aRWGXCA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9351A1F000C4;
	Sun, 22 Nov 2026 00:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795306715;
	bh=z4JW42X5iD/lJnTftpanyIMbBetfqY4zpOSQ2Qgitb0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=X86+OiFxsRqmE4RajiujrKicCC2iLiCwcH6cV/KDtYDVe9lkOlWRts91MfSyEz3uX
	 FdPfc4V6mFOvr4w31u2KvWyHT+ceGALjKmQJfgrMo70MwDSOgopfx41GZcgv1ik97l
	 Jh7Ww6Cr8fOlgS+lUxMzngUFBPOHMMade4eRp0eAHqoLuNtEh1itjNX9cgwHk7edCn
	 WlrHTKrr7Eq8syjB3N3SJS2t2gcTJYWYA3nFYCa8k75VUDrnoynS7pLhQJevA/qaKw
	 UaabVH5AXFgiq5rtigjjAP4rD0wYxemE1UrykHkepbLVu3l0/vakzTbW49Lrny+MR6
	 l8PpVJBpLFthQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1520B4BE84;
	Sun, 22 Nov 2026 00:18:34 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 00:18:22 +0000
Subject: [PATCH v2 1/5] dt-bindings: cpufreq: apple,cluster-cpufreq: Add M3
 family compatibles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-m3-cpufreq-opp-v2-1-3c19963f55ee@gmail.com>
References: <20261122-m3-cpufreq-opp-v2-0-3c19963f55ee@gmail.com>
In-Reply-To: <20261122-m3-cpufreq-opp-v2-0-3c19963f55ee@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795306712; l=1356;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=+HvmgCEavFBOajIqGH23VOYZLXgPd/UuvSVcHqeHPKw=;
 b=z7zddloP5EtRFMXyJY5E/A9JMBGgVglJHOLM/RajrTCnZGnaUnELqAyKW6QCNFMSGGsSeOZgc
 NnaUlAcaOpdA31VcpHe18Zo1yn03btSsZQKUSUQTAf3j0IXXXcTkCNf
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



