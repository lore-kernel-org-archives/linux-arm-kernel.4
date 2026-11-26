Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39221606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QfLHtaUO;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=hZcfPMrq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XFBIvew0Tv+rRG9MYjkheT9FNvu3wnKl3fi7Xx846GE=; b=QfLHtaUOPEIulJyx5KbUTzYAx3
	KhVX7y8eUbMOB2x2pqpE6uh08L54g0nU13bOz3dH9YxYWCNvWpkERrRGZUIg/xbWqs6iWl3bRzPSU
	1ADYZTf8JHq2Cpq+NuSrjAh9XE8faruNFE2wCvuJ4CombZF+udkKp+JSZqHLk3UsQXebzkXGceSjs
	Z+VIl9WlNSFmnuALR84k7CaQbXyjitGxIaLcKjQLrf9Q+gbFHfONmoh0vZOq0q0j8EaT/HXGY5mUD
	uCujJNMVMIAVND4ScfqOcGBj8wKwXYA9E2gDOo8t1qxJalYW3lwJpdt9jJqKNc3A6Mh5sXhtbEOR1
	DQPr6PzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbfc-0000000DmsR-3Z7U;
	Thu, 26 Nov 2026 15:46:00 +0000
Received: from mta-65-226.siemens.flowmailer.net ([185.136.65.226])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbfI-0000000DmkG-12SK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:45:47 +0000
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261126154534a39f7d3935000207a1
        for <linux-arm-kernel@lists.infradead.org>;
        Thu, 26 Nov 2026 16:45:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=XFBIvew0Tv+rRG9MYjkheT9FNvu3wnKl3fi7Xx846GE=;
 b=hZcfPMrqsx+JvPqEunZOHTnsEenTq2Pzs624VK/Bdh3XCTk8mwcakiuhawnIqowKtUK13V
 r+xCBiltQmpijsRH1HbMoOoUqFIzLnLz3xyhrn5Z1FLCuznmY/yuDvZBvVORrUoMQig89pfL
 v/93XbAGrjfUZBgG3T7n0cpG6wWpe9UvvYHZtVljDrCXmwgsvYnN6dHr4EibFSEHgXxMrKuU
 6SJ4Qjpn3ycKiUszIyXjcUee1mKny26n/wLCRR5oKZa0Ob3Pva3txTlUq44JSwiRtNv7nuX1
 qr/P2a+Hbai5+s4YTdXjx+s/1w0pxj9fZMHcK6FdweC210OGQAzFmzXA==;
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
Subject: [PATCH v2 0/4] pinctrl: single: follow-up fixes from review
Date: Thu, 26 Nov 2026 16:45:21 +0100
Message-ID: <20261126154529.1599568-1-alexander.sverdlin@siemens.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_074540_821711_35EFDBC7 
X-CRM114-Status: UNSURE (   5.82  )
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

Changelog:
v2:
- added patch 4/4 fixing Sashiko finding [2]
v1:
- https://lore.kernel.org/all/20261119232806.4093754-1-alexander.sverdlin@siemens.com/

[1] https://lore.kernel.org/all/20261119205013.2563811-10-lee@kernel.org/
[2] https://lore.kernel.org/all/sashiko-outbox-224208@kernel.org/

Alexander Sverdlin (4):
  pinctrl: single: Also free the pinconf table of a duplicate function
  pinctrl: single: Don't remove deduplicated groups and functions on
    error
  pinctrl: single: Reject bit-per-mux without a usable function mask
  pinctrl: single: Drop unused fshift and fmax

 drivers/pinctrl/pinctrl-single.c | 37 +++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 15 deletions(-)

-- 
2.56.1


