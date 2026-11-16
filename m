Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0EE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 03:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=klYeFwAz;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=buq+J3hA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/hrvyEM6Ru8j2MY7/K4Y0eZLUVmPIavguQMTvmC9co0=; b=klYeFwAzAR93y1
	ileGM+V8hy3ABLd4WmD382u0M5yxnruZmocJT41jnI0HOq6ZGeSpiyLL/G04rjbeGsoCG8tnRogdA
	wZrPhibOa8gvd6+PoAOjFcEOPWeR7204skLiFzJ7lk3PwBj/O8M4WIfCLIGVBswfJ5tK8vPg4mMy8
	I5n4VDp36flj85rR1NxEquS4QYiGb6mzLEXsjS93pzJxemx7z4L6ylS+VezvPNlj+bbnaechERmX0
	WpqrDqo3aSQLmMygn9gh2rFj0eLlphivJedRsoBZsFDqNzJocdtelNYAF0lvKMbwEX1XEAOX0ji0S
	d6GXGu58Q46TToYsfCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSn7W-000000010T7-4BEy;
	Mon, 16 Nov 2026 03:11:03 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSn7T-000000010SU-05M1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 03:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=buq+J3hAwQnfDFduZU2G+tJsRWL/xW1+4sTFrayeIq3ylj1e76vdCGcSFUqYKJWFW+t07pva6Tg7b
	 bFtwX++Yd+V3pFN2ACKsY08namg/HHNVG/kPqtHGC9dBPZKMx+NTkpnVxFPsyxR78pQ79IBaQ5Jq6m
	 o8ukkNCRqGqzs6sw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76afa7435154-fbe2a;
	Mon, 16 Nov 2026 11:10:45 +0800 (CST)
X-RM-TRANSID: 2ee76afa7435154-fbe2a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16afa74334a2-7a403;
	Mon, 16 Nov 2026 11:10:44 +0800 (CST)
X-RM-TRANSID: 2ee16afa74334a2-7a403
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: ukleinek@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-pwm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pwm: mxs: Disable clock on invalid period error path
Date: Mon, 16 Nov 2026 11:10:43 +0800
Message-ID: <20261116031043.508-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261102105005.1007-1-laixiangwu@cmss.chinamobile.com>
References: <20261102105005.1007-1-laixiangwu@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_191059_621145_47305A22 
X-CRM114-Status: UNSURE (   6.16  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

I've noticed that Lee Jones' series "pwm: Fix various bugs
reported by Sashiko" also fixes the clock leak addressed by my
patch below, with a broader scope:

  [PATCH 2/8] pwm: mxs: Return early when disabling and fix error-path clock leak
  https://lore.kernel.org/all/20261105143847.2559586-3-lee@kernel.org/

Besides balancing clk_prepare_enable() on the same -EINVAL error
path, that patch also handles the !state->enabled case upfront,
avoiding a division by zero when state->period is zero, and it
already carries a Reviewed-by from Frank Li.

My patch for reference:

  pwm: mxs: Disable clock on invalid period error path
  https://lore.kernel.org/all/20261102105005.1007-1-laixiangwu@cmss.chinamobile.com/

Please feel free to drop my patch in favour of Lee's more complete
fix; there is no need to keep both.

Best regards,
Xiangwu Lai



