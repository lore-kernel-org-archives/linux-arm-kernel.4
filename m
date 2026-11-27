Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B322B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O5Ff510x;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EmOl1sTF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Fp1sHHE8iensX+W04GwS2LW1iq02KpUrNL8xdDO6Vq8=; b=O5Ff510xOaogZ0LbByDKzCRTyv
	IxlMqgryg/ws14YaOFRvqI46i1mhAzMlSiIziTKyjaUEa7Z3auHROxoQyojZipcnPAsuFlG7M/UpR
	5nuhbCPTve44ECxa8hDw2tG3BeKJquXWwQrwWqWDojzPncMxYRKyp247VUyOrRBKV0VZL1Z3Cx3La
	9Vax9xOdvyAVCju88hBXOaBRpRyXEMMzt0uWZ7lOEQDWjdoORJI36gXlOKQbyFLuAQKJeCjkwYqow
	5KG/4ETQZ2QNcuPps1J+J3LNqikPlYY/o/gE+o1MwhPP2YX5xdJzMIsd7Ug1wZQ8vJEuABZWOZAGz
	tA/YHiBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0zT-0000000HTjB-30RU;
	Fri, 27 Nov 2026 18:48:11 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0zQ-0000000HTiC-0ggy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795805289; x=1827341289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D0w9BNt9qEC8lOg2vB9ybt46qq5voBtFztIYXjCX1Ew=;
  b=EmOl1sTFbxqBBQDFfbKFj0c4tJeW2/jZnC0ivkLy2CBYGxtmYjVAh8ri
   fLexlV48YfLRgNAjkbKAX+aaOxcbWLTpL+H4VkN+cUPgqi9ToT9fJTj+7
   GWHbBk3etSlqGzA878C1FwhXf5HNykFYKb9d7F2oibCGmfBOT/stw6m5G
   ZNUrHWgvfld9bzhmNt/jECc0mCbhdIgqX80VE8Lrryk/rqvUc6BGi5nkv
   lXKKwxbeMhkZwEd0pF0TXC4DGeNjKZRDSYTL5VqycpeyOfnoqq7YSM2zt
   bUGsAiqS4GUua7Pk/KgMZsWCO8k42NHsPgvPOP3JVUbQjaA3ghoZ8Mw8/
   A==;
X-CSE-ConnectionGUID: OKuaY668T7OQtPk1KC7Bgw==
X-CSE-MsgGUID: dqb6W9fgTzqupcObHRKcwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4733148"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4733148"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:48:08 -0800
X-CSE-ConnectionGUID: KPdO2dfRSViq8TznPb/Row==
X-CSE-MsgGUID: 95pHJ8OVRcGrGGvV0AKTLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12770637"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:48:04 -0800
Date: Fri, 27 Nov 2026 20:48:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Lee Jones <lee@kernel.org>, Long Zhao <longzhao@ambarella.com>,
	Joseph Telaak <joseph@telaak.dev>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFT PATCH v2 07/14] gpio: max7360: create the regmap-irq chip
 from the gpio-regmap callback
Message-ID: <awnQYsv3oAHWr2ht@ashevche-desk.local>
References: <20261127145232.814492-1-mwalle@kernel.org>
 <20261127145232.814492-8-mwalle@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127145232.814492-8-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_104809_837581_2FF1082B 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 03:52:24PM +0100, Michael Walle wrote:
> Use the new gpio_regmap_add_irq_chip() helper to create the regmap-irq
> domain.

Okay, but now it makes me think why we don't call regmap_del_irq_chip()...
Missing part?

-- 
With Best Regards,
Andy Shevchenko



