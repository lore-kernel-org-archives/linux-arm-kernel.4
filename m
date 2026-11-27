Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8985606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fr+iUAoR;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=igkOSd06
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DvmbVObzWQ/wjQetSsmCBr+QUtK2yXQRsQ+DR88rIOg=; b=fr+iUAoRccEeG2hDHRZPJzjqJc
	0z2GbOaypLc03ZbZGmTn+X56cDHwzprgdUKQglSDJBk2GSFyiXM1XfxERdao6UASVMpUz+m8tL/z+
	9U138NjlVwp7VLyYf9KG6p5GyGTBduWlUXge12CVLQTqiEB36BOumr65MOSVoF5znbhDxxTHo+iD5
	9dypYy54zf2cRArXZAKWMfxEy+FRgtkOVURpAjKJ7FTCPc+rWi9vbmWiDFOET7BtrMt2KUPKphRlJ
	b3bRndutUM4zyXKYXEtOiuycMAsQw9e8nIrV91FiFv73AU+gZb2pE1vKFj4hIOJEJb3mVGlh+Iehf
	p19GvFVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzHu-0000000HBIm-3wuT;
	Fri, 27 Nov 2026 16:59:06 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzHs-0000000HBHj-02Eg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:59:05 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a35db2d6b3so58807545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795798741; x=1796403541; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DvmbVObzWQ/wjQetSsmCBr+QUtK2yXQRsQ+DR88rIOg=;
        b=igkOSd061Hy6pv2D91bfoRfNOZ2n/cuUKJEYUKhKgyZrO200xEK53wuKJ5Iota2aW1
         vTLZPU4Bhnfy5aC7oJEI6jKFcYlDoek0fOwUfKrRglZV8z7ZJ9yFKhxviUPpSVyPZ782
         wfKvbbLz2qm+mMRg1GH2DhhHCgJnc9mOj/G0AsWtx/SQj38wgougOJsZiSIn96HLke/h
         lK1GioarG2ro39Uy6Md04Uq0R2ZEZyvHvqVtl/oFKslsIINykGUVDnPbyafOGVEYTGNh
         03SSEus/K8SMUfV/D1Dc2121m47eynJTEhK7JPormr42ZdKvopD//e10ExHpCawpHalB
         42XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798741; x=1796403541;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvmbVObzWQ/wjQetSsmCBr+QUtK2yXQRsQ+DR88rIOg=;
        b=ZML2HZUWSCDoMH2AMDLAjErXXH+UPG0kIgFJGFYCvdrtiCu8G/gXPgI7YVFgymNCvg
         lhdMAKE/MzmlkD74g1YkR5CH7vqlKnLdEH1/AmEz5Wpx4YbeucDngxftIlfPX5WQL2n1
         3FFYeTyYI6kkmB3XbC58NRQSBstnTxeZlkr05kIxZ26PV/J6Tdwh7szCYJh90cLBDZgm
         SsTTXvdz6ZHta/hS7nMsPIqPt+bOK2vj7gsao06Ejm3g8Zlh+Zg6pbwB8w8G9y9S58T3
         i9ZdNTVX/07twhqAMXskELhDWnbh/c/tlrNyKj2wK2whZyDt8UE+8DzWc12r91+USK/1
         9EAA==
X-Forwarded-Encrypted: i=1; AL+hErHV6t1+pVX9fG667x9yFChGNWO/MPtBsG3SeS8GPT/ajJWH6HVkEKfLCHYGhFnxieUaQSU0k9Cx7O3Zc9pDEfJk@lists.infradead.org
X-Gm-Message-State: APuU4Z/D7ZeuVma8iAzIzaR9a0MrENZIvPA414Ny7CXHVWkP42UxlavB
	2bXlMsULuFkV1HHIMlzglxi/fqvWBB/3GPgSKGP5qW7yTcywWQ05K/NmZxF0aVBA8Ythyqb8TT0
	uSZYrQOpDs5jD786QrCNnjQ==
X-Received: from wrmk2.prod.google.com ([2002:adf:e3c2:0:b0:4ac:b8f7:9ef4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c84:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb8881f47emr524772265e9.25.1795798740885;
 Fri, 27 Nov 2026 08:59:00 -0800 (PST)
Date: Fri, 27 Nov 2026 16:58:40 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127165843.709034-1-vdonnefort@google.com>
Subject: [PATCH v2 0/2] arm64: THPs for systems with pages bigger than 4K
From: Vincent Donnefort <vdonnefort@google.com>
To: will@kernel.org, julien.thierry.kdev@gmail.com
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oliver.upton@linux.dev, 
	suzuki.poulose@arm.com, alexandru.elisei@arm.com, andre.przywara@arm.com, 
	kernel-team@android.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_085904_086063_2F7770E3 
X-CRM114-Status: UNSURE (   8.43  )
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

Enable THP support for arm64 guests on hosts with a page size larger
than 4K.

Changelog:

v2:
  * Memoize sysconf(_SC_PAGE_SIZE) in host_page_size() and back
    PAGE_SIZE with it to avoid repeated sysconf() calls. (Will)
  * Rebase on origin/master (2f3abe56dcd2).

v1 (https://lore.kernel.org/all/20261019145949.1922019-1-vdonnefort@google.com/)

Vincent Donnefort (2):
  util: Use a memoized value for PAGE_SIZE
  arm64: THPs for systems with pages bigger than 4K

 arm64/kvm.c        | 21 +++++++++++++--------
 builtin-run.c      | 14 +-------------
 include/kvm/kvm.h  |  4 ----
 include/kvm/util.h |  6 ++++++
 util/util.c        | 15 +++++++++++++++
 5 files changed, 35 insertions(+), 25 deletions(-)


base-commit: 2f3abe56dcd2658dc6dae3eeeb4996dc4b518bcf
-- 
2.56.1.839.g22a8290db9-goog


