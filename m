Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD767606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ttx6Epq1;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LD/8CbD5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iBMJMhOL8Kb5hAfCP025dmZxdoZXsXxC+uVSSGoi3Pk=; b=ttx6Epq1vFMuIkioLSGjZY7etQ
	cibvYZt76A5++VCmluNqRq4Rfu8UMB+6Ec/r3k+hwz5mXQh0an92YTSUppf+GOY4VmsgSG4OKzvTx
	DdweH5VWJws4HEXiqCb79tTwF9bngGFiOZoR2+ExvMjf4by5EApWAwmjjblSP6y7szmZ63srKY4o6
	St9UUqh1v/UPuvnT2mktuxmMRo2eJHosJT9Q2q2aai979TjWAz73itBjlKSmB9H+ZUEwDy4kr37NJ
	GMHWdwEaAGVe5QVOgkECCESHdpZ/ESXDxQafKK750EuUmHJ3auTdg/jjMbwLun/zLvk0hYSTM9le3
	cdflITDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVJz-00000003mXQ-0cqB;
	Mon, 23 Nov 2026 14:47:07 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVJw-00000003mWB-3fDP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:47:06 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-48e0461e040so2629065f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795445222; x=1796050022; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iBMJMhOL8Kb5hAfCP025dmZxdoZXsXxC+uVSSGoi3Pk=;
        b=LD/8CbD5tU1h9eo3j7Oj20C8pYiaLxOr70wj7IwcaDTpxXU4VO1oB0YgLK2sY4Z7pX
         6O+hvgbr6lQPGTyEhEKW5gbLjV6xfE9cc7621mBc63Fbq2WLaVKmgqhr9hIIA3JXHOsR
         BCz/yjqRF1yziGvUGLJLtwZiuFST36snuH8Y9SISGZRlG0OMVardhP3cfsrMHrHeKrSN
         rdW1q3Z3DeYJrXIE7WKCcL4ZPLNfrf0fpuoAPt3SHvw5GIPZ4vLmi/puc1Qy6i+xO42C
         kyEbB2GZH6yTqvhVX9bD/CKVyryZMC0QLe0MnnSVpybvaif16+mDm1SEJQ06bU0fchvP
         siow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445222; x=1796050022;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBMJMhOL8Kb5hAfCP025dmZxdoZXsXxC+uVSSGoi3Pk=;
        b=twfUw6IUw4t1uabiy4MdX2PMxhEUYCqh9RtzjNY/9+TGJU79uyVNNyvP/4eiGcWvhM
         qIlCrF1lrGjgH07nVNLEONTDdLTYLyEunhcr5UW+pjsDUhUlDBlcsHOF+zzTWcrX4cjK
         WZKrabirCuroM0BXq5oeNB/uN0Ap6Gb4bdTuXhtJ4jJ2Yzr9q8/K16Bi0lkNO6B5ECb8
         eFMqA05DonNgMgJ/LeIhKzLnkGi1/c+m58SrcOCoEfWbfauD4xaUMA1cWiZ6XKFu+n9v
         XR85L+ZHFyJpmdWEbuP4Svrkar8JTGcqKrXeoSCjYlw2Wu9Y0tQu5FHVy79jHjUf30V2
         76Vg==
X-Gm-Message-State: APuU4Z9cHslmSAk5lWLfpIqQASaWA4cnBwTxhDgHDPisTVrkAxuwO8ff
	TV26dH8osbPekz2J6ZlRzC8zRX7ygHy9uYBJGmQDmODYrw7rcLoxBPmmu64mybt6Y6LhLlRkA5W
	mRjP8lauq7fx8RFE4j+LXi2y+PpB3SPaQq4VuzsIjvL3i55waW6OIhVfputh5Nanq1CfUVNS5c8
	A/f/XclqH3G6FrPKHGx+C+aBRUEeTDNQ5KoDk/cZwfRtYI
X-Received: from wmov21.prod.google.com ([2002:a05:600c:4715:b0:4a3:9bdc:d7e4])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b83:b0:4a3:59c9:a747
 with SMTP id 5b1f17b1804b1-4bb8880642cmr227145175e9.17.1795445221992; Mon, 23
 Nov 2026 06:47:01 -0800 (PST)
Date: Mon, 23 Nov 2026 15:46:34 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=430; i=ardb@kernel.org;
 h=from:subject; bh=VCSonUNXzMw6FiIcNUG/gFPwPBIw8NL2XKKXvJllI/w=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZsl8NT1NOaMBrOZJ81O6RivzNU99CllaUiAgz1//M/7h
 Y2Zui0dpSwMYlwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCLPPRj+2VxeVNR3TejrrAVG
 txpYlOIY/y/dVSUqw+kqpVEdXCiax/CHuyvv8L9HMVVVm1/XBR3bYTl9xcYVayecVbotE2ZTV36 IGQA=
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123144633.2725921-4-ardb+git@google.com>
Subject: [PATCH 0/2] arm64/boot: Some relocation tweaks
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_064704_917316_E2B00D2F 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
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

Fix two issues I spotted while playing with the startup relocation code.

Ard Biesheuvel (2):
  arm64/boot: Handle RELR relocations more efficiently
  arm64/boot: Discard NULL relocation entries

 arch/arm64/kernel/pi/relocate.c | 5 ++---
 arch/arm64/kernel/vmlinux.lds.S | 1 +
 2 files changed, 3 insertions(+), 3 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.1.750.gf70dc682cf-goog


