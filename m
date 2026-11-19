Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8DD606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WwySQNbC;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G+c15Mzm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fIioJ6mtDlkzcA39o7TwZhP7GQBcH+YHd4sbuSV8QiA=; b=WwySQNbC2Fm23CU3Kf+K9ZvJ3p
	S0XZESHAT3QIt6Z97PtZrqmEIFRxGH9d7FqUidKiTX5E8wqWrzqhGjhip3yQfJGGydOO9JV3CBA1H
	nMypFPi1EQ8fQjtMcKlinWI0fAKd0aXxelux/Do2A63fq0E4h1oO3OM+sbIOM+QBjlX6z4pcogy3W
	g3KgT2Qs8WSBH/F50efXrCDjksm8KMcPlfsIncz6D0QxSW8VhWZbSRl8ba5r3/f84Wm1eByyC0K4R
	WoeKlhWoQNm3COAItA9lYgqPhNpLtc+FbYG7ApaczEG4enAgDkBQ7gxFWZh5elPDV41YU751ELXyc
	pKW1K1xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5T8-0000000Ckny-0Bit;
	Thu, 19 Nov 2026 16:58:42 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5T5-0000000Ckmk-1ptS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:58:40 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a35e1d2dddso19401495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 08:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107517; x=1795712317; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fIioJ6mtDlkzcA39o7TwZhP7GQBcH+YHd4sbuSV8QiA=;
        b=G+c15MzmAsrYZt/B9NpK7n/KsU6Kth1mc73Kim8Ps8DhaZCX9wJm+TcdAZ0UJtVjrr
         3SlLmU4IKUSVYWLGGsUwIszcs3LDGqCpNq4+nqxu+YCXHPLLu78xv5mKnUZWFV868BP1
         YHGjq+p1aWJtn0erAnLqVddjv8/HX3x2yq1Kbgen0UKMRiEqZGfoFrAhzxZ3Gu5JgXlk
         oZlUP1kMhPiHfUtOnpH7VN9dY6kMQ1KSLo+PcNJUcgGHSqQtAvvGN1k6z9ZeErbLY9c8
         81/WqpGCQEqCPSYxkSZUO6GyEoSclPWdUmZ50xCC4qPlLSmkQQt/jkSX9Qtl999qAdz6
         O2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107517; x=1795712317;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fIioJ6mtDlkzcA39o7TwZhP7GQBcH+YHd4sbuSV8QiA=;
        b=wUd6xkdsLAmI1fueTpD0WEXVg1Ys86Bg1V+aaJnpKC7pIUOn03Vr9JqhjVXH//NUfL
         gqBNgdoDyBO3kMYwZ6V8taHTsqtQ1inwBODlbQCYV2eHG02BW4Ud5CUeuKWTsHdTS8jQ
         t121NzLqkrF7vKGRlbTUr5yI70FwdW8SA6CWpAiSVKS9fhoF6GPUGzOLV8gmNWh1V8D/
         2k5fxYIJdtKi0O0K2f7xw73Pl3+P5iasyHvdiFT7qAf1G7qdLnpJzt3A1wM7i1eMUNoz
         W7scrfSH72Rf2xY5LwlWgNk/VaIVJ1x3TYf5MzVTasTBCdmoW2UNoWSIh6Za8I0kZ6n8
         Vejw==
X-Gm-Message-State: APuU4Z95hon1C/fy1TdWmO9DlwICIm9QVAqzn72wfNae99VvVjKef1aY
	kzRgDLTCZrbxE004ogNx0l9CPqujsXgIvNY0GaubILvuYI/uFBo2d/ycvRcbld7sHJ4R0U54zXU
	OVBmyaylTKfz9bcf4daSQE+Dnyf5+b+MV1M5osQP/14y3vzmQHszd64yc2x/nyCX5po2ceFn7SH
	hiM5npXmY2jd/mNxByj7YRRdIu14aSENKAvtV+w5Omq6zP
X-Received: from wmdn7.prod.google.com ([2002:a05:600c:2947:b0:4a2:8ef:a5af])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:45d4:b0:4bb:6994:abf0
 with SMTP id 5b1f17b1804b1-4bb88817d91mr2150145e9.23.1795107516472; Thu, 19
 Nov 2026 08:58:36 -0800 (PST)
Date: Thu, 19 Nov 2026 17:58:26 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684; i=ardb@kernel.org;
 h=from:subject; bh=RLnHuw7vhqlwPysA4nzO62A47iuTQGsb1Lq9/wIlIcg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu/1qYcKffLq4vU38gJLjdy/mvBVMNf+uXqyZv7D1hOn
 awXF5HRUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbCUsbIcIe52sFO2bO9Wnlt
 6spyy72fDuSsvhOVcrbgxOkOXxeHI4wM036/nOMUdff3kVPvrgorM6QtFj934FieDkt60Svffb6 R7AA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119165825.1793558-5-ardb+git@google.com>
Subject: [PATCH 0/3] arm64: Combine module .init.text with .text
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_085839_486706_90E8097C 
X-CRM114-Status: GOOD (  11.22  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

This is a follow-up to "arm64: Implement support for BTI veneers" [0]
which adds support to the module loader for indirect calls to functions
that were emitted by the compiler without a BTI landing pad.

This series takes the ppc approach, and simply combines .init.text with
.text when loading modules, so that cross-section calls in the same
module (which may originate in the same compilation unit) can never go
out of direct branching range.

This makes the BTI veneer solution unnecessary, and permits some other
simplifications that were added, even though .init.text and .text rarely
end up far away from each other in practice.

Live patch needs additional work, so BTI remains disabled when live patch
is enabled. (It expects to be able to make indirect calls to any
function in vmlinux or elsewhere, even if they were never exported)

Cc: Mark Brown <broonie@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>

[0] https://lore.kernel.org/all/20261005110511.157016-4-ardb+git@google.com/

Ard Biesheuvel (3):
  arm64: module: Keep executable init sections in the core text region
  arm64: Re-enable kernel BTI for compatible linkers
  arm64: module: Revert separate init PLT and init ftrace trampoline

 arch/arm64/Kconfig                  | 17 ++--
 arch/arm64/include/asm/module.h     | 11 +--
 arch/arm64/include/asm/module.lds.h |  2 -
 arch/arm64/kernel/ftrace.c          | 13 +--
 arch/arm64/kernel/module-plts.c     | 98 +++++++-------------
 arch/arm64/kernel/module.c          | 46 ++++++---
 6 files changed, 84 insertions(+), 103 deletions(-)

-- 
2.56.1.708.g77570a6a1d-goog


