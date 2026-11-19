Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDE7606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 23:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eVezf+t1;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=MN5f/I3K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9/o/W5tNcdOKYmk/LYihUWpWeggbfuzqwss5u7J69Ig=; b=eVezf+t1wJVM/E79gNLVDFW5dj
	+fFhbEluIuCxd3tKjg4Zz1dEvUnuRFbQ2z0XnNCQEiGB7CS4QUi1FRLSEjWJFAy5e9IkwkkpCyvkv
	MKc6uYIY7Ut88tHUn7ASJY95ruZ3DRNcEZdi8t8jd97kRNzOmg3uN85vYos2tJoFkJF1hsQkAdSaB
	3ciXaVwn/O/f89w8xYXvdb22GtHakREgAlkYhvNUFu9vsTxyeZ3jmnNpf+9KHgS51oFbbPgNhOpnh
	2MeYMK37gzfKDdHad/c6ZzPQwwKZDguXwmB9jQl3lVrjyRcgPVhQUJcBf5cVLavzaUqiBsey2vxjY
	eAI3JmCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBYA-0000000DeuM-1Jfq;
	Thu, 19 Nov 2026 23:28:18 +0000
Received: from mta-64-225.siemens.flowmailer.net ([185.136.64.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBY7-0000000Desb-05Rk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 23:28:17 +0000
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202611192328099cd139ffcc0002071b
        for <linux-arm-kernel@lists.infradead.org>;
        Fri, 20 Nov 2026 00:28:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9/o/W5tNcdOKYmk/LYihUWpWeggbfuzqwss5u7J69Ig=;
 b=MN5f/I3KOygkqTg61wdZXXmkAAUJQaGGAz//+N9iPobqJr8Seg1FSW/8m5AY5ujqSkQ1Lv
 THtzWfV/3+DIgbunZBHTxdOfHZty9uTziZb4y9UWhWyqG3KFCCFwxdGvsaTkMK+fmPbj922U
 oioPmAie3e/gOU8sCmbFOkfscyKkyu+TXuZFA/XbH6UQiiofy+dU+qY5N+fagJcXAfaiPRq+
 oJdleITYU36jcyyyG5r73fkDSUnlFPgeQdvRWCEUQ2T8DBDeI/3YzcxW+9k/n6lPc7VkXYlg
 afEETQo5gJYWUgIk/vrvqQ+QqzWIK0oJwWLWfA6gxHOlQkIqKMMVMcuQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH 0/3] pinctrl: single: follow-up fixes from review
Date: Fri, 20 Nov 2026 00:28:02 +0100
Message-ID: <20261119232806.4093754-1-alexander.sverdlin@siemens.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_152815_625226_058940F6 
X-CRM114-Status: UNSURE (   8.29  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

These are follow-ups to commit ad2093840ca3 ("pinctrl: single: don't leak
group/function tables on consumer re-probe") in pinctrl/for-next, which
this series is based on. All three issues were found in code review
(partly while reviewing Lee's recent pinctrl-single series [1]). None of
them was reproduced, so the series is compile-tested only (W=1, ARM).

1/3 is a gap in ad2093840ca3 itself: the duplicate function is freed, but
its pinconf table isn't. My re-probe testing of ad2093840ca3 (TPM
bind/unbind loop on an AM625 board, watching the slab counters) could not
have shown it. That controller is plain "pinctrl-single" without
PCS_FEAT_PINCONF, so pcs_parse_pinconf() never runs there. kmemleak
doesn't see it either, because the table stays reachable through devres.

2/3 fixes error paths that remove a group/function the core deduplicated,
i.e. one still used by an earlier mapping. Reaching them needs an
allocation failure during a consumer re-probe.

3/3 rejects bit-per-mux without a usable function mask. Such DTs pass
dt-validate but divide by zero at runtime. Checked with dt-validate and
against all in-tree bit-per-mux users, but not booted.

[1] https://lore.kernel.org/all/20261119205013.2563811-10-lee@kernel.org/

Alexander Sverdlin (3):
  pinctrl: single: Also free the pinconf table of a duplicate function
  pinctrl: single: Don't remove deduplicated groups and functions on
    error
  pinctrl: single: Reject bit-per-mux without a usable function mask

 drivers/pinctrl/pinctrl-single.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

-- 
2.56.1


