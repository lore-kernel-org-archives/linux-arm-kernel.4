Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5B5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AgwqqrrO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u5tCTsoq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TGbZUVyB/p7B87G7D24DxnnI40WatEQY2ar/09q3cHo=; b=AgwqqrrORuu36MlCUp2ggphurp
	NwZL8gMpXMy49rUZGugi8cqYw7QTXurGg7dE4T3dPSqGlZQlHrLIZ9PgICBM3dgWs71QEtr1XXu9u
	O5lsNqgqXeJg5xuwuYqRtJU/XNhubpFYcDFLP45rw6Q3Wqmi6pbbdQo6+F2RrAxT/cI0Aytx4c8/p
	bOj5cne/e6kjgZrHj5PZ2xoYsSYI5dT7qsMF+RxtXrEdNGJBcMFkyVlgazgsKsqJP/fmURUny84rj
	8+gjfgVj5qtXNYxrWpcxBZZWlf5zyBvpr6DQt8uIJs2xVgrBwV1u4fUnTYHvKpiyZ08QIxM9YaFWw
	OVjfrP8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsjE-00000006x5J-1hht;
	Tue, 24 Nov 2026 15:46:45 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsix-00000006x3g-1Gsu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:46:42 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-4b8587b395aso2743415fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 07:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535186; x=1796139986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGbZUVyB/p7B87G7D24DxnnI40WatEQY2ar/09q3cHo=;
        b=u5tCTsoqr+WfzUBs7txY8jTe7xoUN/+fUn1NNpL3mMsbh38R+x60M45jfx/+KduU03
         6a6Zi+yk2odmpuk6dISWNlFzV/NewVgXsSAskcA6WbBoXT80eniBS2hxI766nQHQhEaM
         QrcD5t4Wcl03NZe4IRjaTvYz3PMO5Rv+/5WOGIRUYZut7mvEnE8/DbjoTCARYUJgWMBT
         xhWkhaOE4hcMI4ulRx+kuoEEEdJ0Q4uPnmnpUPLgv/7QxmJ8RmsDUFvUwTaA/xu0vRFG
         o4MbInmWnAA0zIWj3CQ0fayV1n+7npO4VrpjZRgDMlDzUg1gfh7B98xRA0xaIGcsQgkV
         wiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535186; x=1796139986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGbZUVyB/p7B87G7D24DxnnI40WatEQY2ar/09q3cHo=;
        b=RiPaSvepLy51IXxznvXqmylcSBiNtRdx0CQ7tJoVLFHlBKrdWTpxrXyymHIlYoibzD
         XI1LPaRo2TIpXv0T90/Q16/TVK8DrCYfzloVu8mNy7yxzj0hLeQyRTNKFbIzDKxhr4Dj
         EZae3/vfYr95QoMcNV/YCKdA8564v3cRnCc03GzarLYTw3GEG46prucg/ug5CwssAi4b
         Sxi6eBb4leG2oAsKeh0ZSmAlXCAZpSU6i+g1hxOHpRNA6U5edc3DR6Xk7Owlo4QUzxZ9
         JonBNNze3W2EQ+7k2cIWQBl0D3aB0bRxOWPU8TYcv3fYYjfpTIYV/WkwmOlmhVJ3XHfM
         NyoA==
X-Forwarded-Encrypted: i=1; AL+hErF3LYfZcZXi+uGSR/WTo81Bvy1uLOWwsAg09VoktBPUBZnUjEMvLRfBxV7oN/SP704RK0CFgX6NPEaWD5ydupNL@lists.infradead.org
X-Gm-Message-State: APuU4Z+JiloVpKaFvbK0CxX0+dLqCuwr9tWaSG0an+haTeKFCTG4viTc
	jlPWZO4bijsorll60+KTNdEelj6ABMnG7rb/qVzTHnpcTPM2zk+x5Z1w
X-Gm-Gg: AZFdTZfDwd+wzvyHHRVwAr2Vbkzz7ith1/CGkU2C0TL2uuYI37Mva/2rv4XYYLT1X5X
	mXiEntCi07Fym794ZMnM7V1mmk7+6S+pwlt+3tfQ1DOvmw0KQJla09DCoQTlBOHoEkr83FhIpML
	jHcKlDJlLRbqaGkh1bwHi28M6ADlcAKUE8TuYqimqyj9kR9qBNpLoYLQZPoDpcVdloP9fMpcc2s
	9+WWnDZmFG1fzsndpNqSPJ6Gg93lX/oOUIT3XANbq60OEsWFT/VQgzNM57i0AkkW54nRFyeXnSZ
	4wHEJDfSIVfU2inICxXi7mXxymxlklQneaE3JhhsVD/6kgno7nSKYLo1DBfH3vP+Z+sT7YHmA3d
	We4Et5fw3g4yW7QFNeGWEskG8KvPcFZoW6oeGnSU+DPEpD0zUD6qvk8eFOx2glNe3i1rv8sRBov
	kaEpnwc7Mm3iH6hWHT3dJ0ejurkyxPEvirorD6UIcbji6WHlkNt8ePJexZL7d1+/vVZ11EnSObM
	B6bIgPqEU8mCUm5m3Tl6kXuiyZSpADe6GLIxGjN4x49A9h/OEuy/5kAJ9Nb+Fnf3aZ455SWS7nV
	BSM03GyCSm3uHTjxs5rtp6Jd41gC+ZB9u7rog0mwF4jMufJJDq1cvcHNSOSAABl0P1k4wdWH8mk
	Tq3p09rJjHu5kFsYQEUYIyId2o3WZuyWGa+aWYr6PILDd9q98rbErNVm6dltIcxFMFEc=
X-Received: by 2002:a05:6871:7bc7:b0:4a7:2bbe:4601 with SMTP id 586e51a60fabf-4bc85af4396mr12338931fac.57.1795535185954;
        Tue, 24 Nov 2026 07:46:25 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd044fc4besm12324129fac.7.2026.11.24.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:46:25 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH] ARM: keystone: Fix OF node reference leak in keystone_pm_runtime_init()
Date: Tue, 24 Nov 2026 15:46:21 +0000
Message-ID: <20261124154623.340362-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_074636_118550_1D4163DA 
X-CRM114-Status: GOOD (  15.30  )
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

keystone_pm_runtime_init() calls of_find_matching_node() only to check
whether it runs on a K2HK, K2E or K2L SoC. The node it finds is
returned with its reference count raised, but the function only tests
the pointer and never drops that reference. keystone_init() calls it
once at boot, so a single reference is leaked.

The compatibles in of_keystone_table are only used on the root node,
so use of_machine_device_match(), which checks the root node without
leaving a reference behind.

Fixes: 8620d2c536dc ("ARM: keystone: fix PM domain initcall to be keystone only")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (ARM multi_v7_defconfig, W=1). I have no Keystone
board to test it on. All uses of the "ti,k2hk", "ti,k2e" and "ti,k2l"
compatibles in arch/arm/boot/dts are on the root node.

 arch/arm/mach-keystone/keystone.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/mach-keystone/keystone.c b/arch/arm/mach-keystone/keystone.c
index f63671a3024c..4e1f02a73887 100644
--- a/arch/arm/mach-keystone/keystone.c
+++ b/arch/arm/mach-keystone/keystone.c
@@ -53,10 +53,7 @@ static const struct of_device_id of_keystone_table[] = {
 
 static int __init keystone_pm_runtime_init(void)
 {
-	struct device_node *np;
-
-	np = of_find_matching_node(NULL, of_keystone_table);
-	if (!np)
+	if (!of_machine_device_match(of_keystone_table))
 		return 0;
 
 	pm_clk_add_notifier(&platform_bus_type, &platform_domain_notifier);

base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
-- 
2.56.1


