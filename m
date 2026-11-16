Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBE4606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cgrzkTm7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qY4Dkn1N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=focnNfHFlWYzCF1G01fF7j20QFYjF7BQNefzQKj/yZ4=; b=cgrzkTm7shbkTz
	EM4vND7vG+heiMX4Bt2N/kQ8deJqlfZr6Y5Wab4RTeWPhTtp2TuTJnP6xWDITQZSAslc1BtyE/viG
	GU6VUAamxk92ZaNKDfJYV/LO+AWhFdI/z1zKoBFwCKjQEusftcOQLAI15QSaFFZOvpF0ySniseb1o
	jGNj8yTlAgpCSc7zeRS2Bo7vSGpu2INEp1li3g3O8dJrwV9J08N9XKMUyNoLKTacV0KqsF+cQ0B6K
	4kirJwze4hPvX/c3FOV9otbaXTvQdbj7HeQfGCbJoVLbX8SePsGmX5s56qQGkHquQrnYixWGsyF05
	JlLmujO0NMbqCcELxLVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Jv-00000003W23-42Xv;
	Mon, 16 Nov 2026 18:20:47 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Jt-00000003W1k-3hZP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:20:47 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e977109392so21990965ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853244; x=1795458044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=focnNfHFlWYzCF1G01fF7j20QFYjF7BQNefzQKj/yZ4=;
        b=qY4Dkn1NzcBMtVPsLFFB8nTkLn2NqwZADwczZjWw408T7ihV4G8yl828VNNQ64AjGI
         voPt8vcaUnrIhdIz9cyf1jib/oNo334M2QOO1/s88O2QvQS6Gbl266Cc6akVkJ4l5EaN
         skgVviTlGUjvVXMiuN5mMWU6LO09WTV/pWRk++Eh6wMHVZo2unJYFIsbFy1BZuNIoj5T
         m/84peFYhjdRxEwMb3OpH9GZeWYYSvc+nYSrHCKipwYw/RZgzHVgpdLRvZ4RJ1nbCOnf
         rrKPVk4GkkgCYVrZb71T/UA4zsrSEn1rIZr1ZLIBZqH/ngU8e9jIOuiw3to0oDGmk6od
         QB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853244; x=1795458044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=focnNfHFlWYzCF1G01fF7j20QFYjF7BQNefzQKj/yZ4=;
        b=zV0B+GQfK2H5nHNDHjrD93g3xrMxmkbV7+CNwlRSiAE7NvFlgdwTurYwzIFCx/TONg
         jC9QhYU2tSjFo0qIYMa2HiRskXwhgHYGLaLaORpnuYKMXHPBM6F7MYRjQrqEDWTtjq+I
         uxPzusER3GoTAFKNg86t7O7qaNe+InOh6JHQgovM1JhzvM86ylPDgg3aPnCoVfxFaf6M
         ewthMOHaUDzlTDC38yokpM6JP6MtQXEuWJRvZvaTAjMgu0w9CtQuHLiWEzxrqv6u+jHN
         IdW0ZK/NjcJDCrY3bsPyYt0cDvcVI79UJ6MN0vSGdbttLyY/EgeSDnKO4mICDFMzMbH7
         aSsQ==
X-Forwarded-Encrypted: i=1; AL+hErHZOzndtzvekg3Mxg1tnghBzwFDsGmdk3vQUmNQrA07JG4tUbYeWO1/jqEZ3QfN4DlWXSXDxaK3wwTbVikNGDQ1@lists.infradead.org
X-Gm-Message-State: APuU4Z89W2NbxekogYxIHJFuOaZ6IFYQQnkJ+MRvnNLFdU5QB6uQJ3hk
	IhHQd6OwTl4kMaKKoveUuf/wBZbwMB8AFu9j09BIJUZEuEhc2Qerzg1a
X-Gm-Gg: AZFdTZezicapyLwF0d86ud64I0U1ZpTkMQM6IzcAuZ7k8+Ieh47xRNtg2NDBhcc0t/n
	GQnADch260c9G1ncNq4RGbeMLTxOpofpm4GjV172GNH1f/I3WCZZv6oWrhRkZJGzX/ckZqWpMoX
	bXX4NffvZVWBwB4JfzkP74m1HnCR/uPP5fOO9HjKcVHrXxa2CwLj60UKyD15Uq79CW+dwRZHs1C
	P5CNajlK7SaYGWiGdf4tS4+A4lbxxszKoa4JICiTcaQOYEosvwFxzQyNCwnU4Jrga7uEmQNk2Gs
	O6EqIWCMP5OPVt88gloAxzZ00nscGoCvohQwfs7LWAqDaJUhNcMWRecRhxTF3ZNtYzAtCoFYGfa
	qDMXidEf0VkxY6bJIevlDHeMZZmm/uQL6sRvj8/0EkM5Q47u/1msX/I8qhzWv5C2FhahSJI/F+5
	YlQUsy8apobBBD5yf3yqOh4VkGjqKtCB4uKPbbz2oEmTk6Gm6SoO9Dx4Upf3BMv++N2NaGiTkNX
	L13vHTNeyfWaq/Ks1Zi3Ea3h611WJVuat12Ze1gZKSIHzdk1n8V7OIs7i5bT80zrQwUSfj5siHj
	241cHIxVZ6NZtRqezS1wWS9lIhZjNQDxDArf/jA7o2t6nMn1kkBoA81UIjyBfiEJ52R/iiDfwn1
	9sP9ApE8m7zOg1Oll8ro6vQ9nfLSGZBGwecLw
X-Received: by 2002:a17:903:4b0e:b0:2ed:4c7a:31e4 with SMTP id d9443c01a7336-2ee0d65e7a6mr107391405ad.1.1794853244283;
        Mon, 16 Nov 2026 10:20:44 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76db8acsm3076325ad.11.2026.11.16.10.20.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:20:41 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com,
	netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next v2 2/3] i2c: xiic: add KUnit coverage for register access modes
Date: Mon, 16 Nov 2026 10:20:38 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-r1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179484681740.3136.17781028072212776292@kernel.org>
References: <20261112163333.12523-3-ahmadexp@gmail.com> <179484681740.3136.17781028072212776292@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_102045_923859_25DF12F5 
X-CRM114-Status: UNSURE (   6.05  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Agreed. A RAM buffer is not a portable MMIO mapping. The proposed v3
enables the RAM-backed test only on X86_64 with neither UML nor
INDIRECT_IOMEM. The XIIC driver itself gains no architecture restriction.
All four cases passed in an x86-64 QEMU guest. With XIIC and
KUNIT_ALL_TESTS enabled, explicitly requesting the test on arm64, s390,
SPARC64 and 64-bit UML with indirect I/O left it disabled.

pw-bot: cr

