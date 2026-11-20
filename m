Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DD9606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1CRyd0/N;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BME86AkW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kzrGkvF2rBzn/M48OtU+sHRDeBPCOoUsXp1yXuY+Nm4=; b=1CRyd0/N5lD7BG
	Y2/AQAw1hej3wI5/Y4RZ9Inb2u+suKB251Pdggn36SINo7IGezUT93gqdn4Y+8LRG1BTQINBeu3NY
	fbtM8xGZmRXR4qcDwwktwddWhbd1oFLQQV880+NY17GsqpdEn0aSvc6PTah4BjGmNU7GiyrCi9EsD
	Z1MBpw8ulR0s61tp+H6+HHYrhuisQB4K3H6Y6hWMvLyRLqHpASL6V2LzGldJqK4PO9htIfjjNxK9x
	tQvFALkYwTRt5T2XiK4RmqAdkyQ7fx2Y2SQf4tUPNm4yaysEvM1ZcROotiPKWz8JZ00G09uVnH+EV
	PIdeAt+rRodM66X1+PcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMX7-0000000EkAf-1ZWX;
	Fri, 20 Nov 2026 11:11:57 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMWv-0000000Ek6g-0rZu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:11:47 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c4d21051042so144899666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795173103; x=1795777903; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kzrGkvF2rBzn/M48OtU+sHRDeBPCOoUsXp1yXuY+Nm4=;
        b=BME86AkWkTGYSCFTN75rR0mooYI01OitdbA6tmHdC2vZpezCkegxQAdEfuJ7+WcJnq
         OHvvyAds9l/MUm5lfYV138ruRo45v/DYIPOrF5VWP6NdJjlZObTUTaPlSnFdd/M+bumE
         xtwf4JqdOgn26te7L8FXWOimiOw8Z+JCnrpDNPDrU4EtZtK1lu4TNiUD/vNkUE03sMJd
         lcKmVzOl9ClOHK7Tn76xja/xsv3R26ZL1Qeh1WkrU/FuvAWNWNDvfig8sHF9Wn7IJVbQ
         IUXJGEnNDyND0ew7s6gtdfee7WN8zeDARVAVmT1YREUYk7yVr9rvN+bMRDvhyxPR+h0J
         iW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173103; x=1795777903;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kzrGkvF2rBzn/M48OtU+sHRDeBPCOoUsXp1yXuY+Nm4=;
        b=kPfPSlOhXOZ/jK+PEVEtF9i1Ij0QKOG+joCZhinf6/6IFUq+aR0JdGiwB09uJrVaVN
         AwoLoqZK1iGtFJAsK/wG0nIoUokSSokoAYUOh0ueH4FmXw08MFfl71wQuwPpiXEkOL9I
         YgQt3X3kINeZJRMeeFk/c4oeag8AODVRQzvZwAVAM17k0lkDNq+OyXsGyJCCcuBqC0jV
         ZC7xtu8NUV/Ief6K3rkka3zLinE4OTIEEVNMCEwZFX3Ek0qFtHuTJFn+WClRK4J8f6+6
         vCIrDzIzLcJKDaNYRH0ZatpP2vCXsOkybnmHwkzVM3VqdCxMkmZOzQbDG9biixS6YeX0
         jZyg==
X-Forwarded-Encrypted: i=1; AL+hErH8aqK2nQr44EvgZvfkxZEvFI1zgmAS8ivpCh8Do4ulJO/Z6FrqKeHK+//JWchhWnX+Q0aiZ3HGpSFZ9HgxrhaU@lists.infradead.org
X-Gm-Message-State: APuU4Z/3Q+9Ye3yYkX79975EY511iJR9CkPN+0kO9a0rAmD0LhI5A2Ki
	pxnLsyl0GtwEM0lfcTaoHGUr8fuJQ5qLwaHRDJrKnWysJVqugBVRyB+hrQ+nf5y19Os=
X-Gm-Gg: AYBFou2syR1VdKBzfA5NxQNufT5SbE3gNlbESm3Nya96W5bUknzJeQ7ASAeVzNKuXTW
	NY6o+RlfFGLc1jLzzjN4ENXlt47qKqqcXUQeNA0944LmPCeiKqBWf/nOaAqgDJXyD4AJ/bCsKY1
	F7/qIlTvAV0ygeXmdEMD5nvaOMteI1ylSHm6MeK3UTxvhd0ziqDD2w/S6OnSDcClzLjfAS7GMOr
	/tEnWLL19slXpe7Fu36RUNv90DmmaxMD2thUWnc6nUOvndyRqKUDXcUVikY+56/dqyo99EiPmsI
	WyXGZsdc3jx1KK2GOxXrEnYKZZk8ebSgNa8g2Gvof/hpYsq2uem2gG+OVhWgbxVLOhYvgILaVEj
	doBjyurXiF+ineUrFYpLFy7xCyKLwcaUkfKA3qm8C537T9BGYtfDuuN1hbPFTE2eA4FEzk5RnZ6
	Q7eq/OHxa9X6Xj9sbdECjGxsqDJPUmLfZUEbHgdNIS66DpZYwvkjzD414iX41WRm0d+Hg/m0s7k
	e88SIpT+YvSg0SG06Gl/rYfMvEqsqj/RYgLWK7zmLCCDaJhNKfi+/yhGoXbD5UXSLj+bKkQOmCE
	w8sbxAnL9DWEuDq1QAgkfmkUmRvf8huRk1DdZbzOedNOeti+h0KWABtcdC/130TQeF7Vzia2KCn
	0vqEev/WS2UIwW0g4pLYdWcEN9L9LN1d8jL17WA==
X-Received: by 2002:a17:907:6ea9:b0:c46:a5bb:5740 with SMTP id a640c23a62f3a-c513a3a656cmr295368666b.5.1795173103212;
        Fri, 20 Nov 2026 03:11:43 -0800 (PST)
Received: from localhost (p200300f65f19a904be03815e1634e776.dip0.t-ipconnect.de. [2003:f6:5f19:a904:be03:815e:1634:e776])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab69bf61ddsm4595920f8f.12.2026.11.20.03.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:42 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 07/10] clk: imx: scu: Allow untainted use of driver_override
Date: Fri, 20 Nov 2026 12:11:08 +0100
Message-ID: <ddc76beb6482214e115d8ab205056456924c5db3.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
References: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=870; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=jgaYqFkp6U+MJCxcDBbdbssya7kT8plptxESbnjDSnY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrACrYXpZia37r5qPKPkOrurPKrb8qglkFq6zaI hJ6qIxGohCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawAq2AAKCRCPgPtYfRL+ TkoCCACdj0BNZECS1Bkcr2YYSsgLgLNmeGbEzHiUikzoyjSPUo+CaGzWVCCIET0XINWo9+3waXU PSQpRPKpDtKhIld4oJWXugSRyfxjuz1E43RBa7QiYEYbyNy9LlMIsBccnnHXDPn71inefjcuwEA W4ud3FTp9OkvqEDwnW9c7nB4ghuyBDxk22UkGM0l+4qOyp9Z8WHOmFkO5hMt6GkyBnzfNzuTDZC 72tn4Kbk7FcuJMIEKaVxAuGdCpUaCAOhQ/1aRAYdp0fM3IOXQEspsJ24o/Wyg3SPgSM0I9Ek4lP CI0G3MZ6IYzhgWq5ed0ZyQb7gf3EgesBp/kPF5U4A+pSFKw/
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_031145_285869_9E95DFAC 
X-CRM114-Status: GOOD (  14.56  )
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

The driver makes use of device_set_driver_override and so should be
allowed to match via that driver_override. Note that the .probe()
function assumes that platform_data is set for the device to bind, so it
can very likely allow root to oops the kernel. This is not a regression
however.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/clk/imx/clk-scu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 0d034e206c6b..7622890d1124 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -626,6 +626,7 @@ static struct platform_driver imx_clk_scu_driver = {
 		.name = "imx-scu-clk",
 		.suppress_bind_attrs = true,
 		.pm = &imx_clk_scu_pm_ops,
+		.support_driver_override = true,
 	},
 	.probe = imx_clk_scu_probe,
 };
-- 
2.56.0.rc1


