Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EF0606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 08:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xfLWDYHB;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aujXAkEF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CEs83Sr1XhEd2DXMpAa750j5Z0GIbDWQqMk0/gmeD7o=; b=xfLWDYHBEh4IfHka0D27X+HTVt
	9/om2b5zvwY4XiBLy9fKu+Xqj9HC5iLtikT0e8KYbfyRU/Q2zMD6qLOf5y+iPP46WrnZOuVXhev/w
	O3kKSRRdstXfXwnK2qHYKak7iRUMPBFCE4J4xH1jtRpgFGZ0+CZV1suUXUzzu0++6GbXnH8bWiBCz
	HJ2Mg8TPztm0nzU6+FI1FHhU8BZtQklkKF/zo0QYR++95+mWX3OKVjIsfzpMCCG+NsGJvRNW8/MiX
	dnADGtwYMLLtJo2N2hAp3s8qRkWOQMTOaDWO/is1M/VEpB8AjsxtUaLdkR0z7t/p32qVziQMpHdaN
	4nng2MvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS8se-0000000Fa1V-0YHV;
	Sat, 14 Nov 2026 08:13:00 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS8sa-0000000Fa0y-0FHo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 08:12:58 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CEs83Sr1XhEd2DXMpAa750j5Z0GIbDWQqMk0/gmeD7o=;
	b=aujXAkEFYwrNXIPo4ckxgDufLTx5qGt/hEp7zFk59xz7QEt+p/rbiBbMuz8i+P+gBrKNMmlBp
	VxJ+9i2PUlJapnVw5FIgoT0xSmO79EUvhfjmrzJ7cJ8LdKhA6eNdz2Q9pykTEwI0LkbNO61qTDZ
	m3nxNath3ymLz4QlpZ49xNQ=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jRRgh0vw6zKm6K;
	Sat, 14 Nov 2026 16:12:32 +0800 (CST)
Received: from kwepemo200009.china.huawei.com (unknown [7.202.195.26])
	by mail.maildlp.com (Postfix) with ESMTPS id EEC4240578;
	Sat, 14 Nov 2026 16:12:43 +0800 (CST)
Received: from localhost.localdomain (10.50.159.234) by
 kwepemo200009.china.huawei.com (7.202.195.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 14 Nov 2026 16:12:43 +0800
From: Long Wei <longwei27@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>
CC: <mark.rutland@arm.com>, <broonie@kernel.org>, <kevin.brodsky@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<hewenliang4@huawei.com>, Long Wei <longwei27@huawei.com>
Subject: [PATCH] selftests/arm64: signal: fix inverted feature mask in diagnostics
Date: Sat, 14 Nov 2026 16:10:13 +0800
Message-ID: <20261114081013.964933-1-longwei27@huawei.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemo200009.china.huawei.com (7.202.195.26)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_001256_650404_28D859BA 
X-CRM114-Status: GOOD (  10.10  )
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

When a testcase is skipped because an incompatible CPU feature is
present, test_init() reports the feature set with:

        feats_incompatible & ~feats_supported

That is the set of incompatible features which are *not* supported,
i.e. always empty, instead of the incompatible features which actually
triggered the skip.  As a result the diagnostic prints an empty list and
gives no hint about why the test was skipped.

Use the supported set so the offending feature is reported:

        feats_incompatible & feats_supported

Fixes: 32de73e89099 ("kselftest/arm64: signal: Allow tests to be incompatible with features")
Signed-off-by: Long Wei <longwei27@huawei.com>
---
 tools/testing/selftests/arm64/signal/test_signals_utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/signal/test_signals_utils.c b/tools/testing/selftests/arm64/signal/test_signals_utils.c
index 4b12dbd7669d..16036e06d6c1 100644
--- a/tools/testing/selftests/arm64/signal/test_signals_utils.c
+++ b/tools/testing/selftests/arm64/signal/test_signals_utils.c
@@ -365,7 +365,7 @@ int test_init(struct tdescr *td)
 				fprintf(stderr,
 					"Incompatible Features: [%s] supported\n",
 					feats_to_string(td->feats_incompatible &
-							~td->feats_supported));
+							td->feats_supported));
 
 
 			td->result = KSFT_SKIP;
-- 
2.43.0


