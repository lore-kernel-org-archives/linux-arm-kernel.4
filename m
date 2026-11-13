Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC57606DE9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1GcGTvVI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vQ7MOXs6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RGmNdmvX7GyDyj3rjdj61uFnaluwz5zplmLJm2EDWYg=; b=1GcGTvVIC1LofH
	cFji4b2LLVWMTK8VZ9wE5SslJfYbsxPqD9bQtI38bMnPLAqi94ImS7+JUE26wqpT5UzG3PCDsDxlP
	RcTSr7KQ5mo/n8Ot7wcfxNIJB5cJ0f9VoGDkiHofMesD5cXsQKju1SN7cdSaWwhQDwnBo7YW9aZfA
	V0JDJ/tUvSiUjZ0ZY61jvf5IeX4eKEj2lVCbn1I4gTGULObahUOBWjkRW8KdKWFcvkrGyZ1sn9wKd
	VnUuOPdtsZJmMp6mCBIlqdR+Sqn+7DenguhvmSCApXhDZ97TZQxnH94QFFEV6WICMgne2vOSmm8if
	8OjkOUOBV6uK3kpDgZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfHl-0000000BL8G-1MsF;
	Fri, 13 Nov 2026 00:36:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfHZ-0000000BL58-2TQb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:36:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so8650705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530204; x=1795135004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGmNdmvX7GyDyj3rjdj61uFnaluwz5zplmLJm2EDWYg=;
        b=vQ7MOXs6EYX1MxBveJpK6G3w/iwvS0vbIIKMa8D3kbrbdkZS/vIE9UE4t572e+IO9h
         g3QPsgfHTKSc4ZdKVvgt/B/z88W5E9Amm4ywdql02jYl1SDTRhiTQNqCK67ubARNX9h+
         93zVHoMVDqJxX7QhGvuSuEPmzkxqfuReADFvMhwWz9t7i2lmzh1yIki6ddZM0cGyyVv5
         v+KxuD6/v1qyYdmMQ7Dbwg+nY74ifkIA5UTVQ7gUHlRPgGx9Hzw4Vma7s0aYcs/DYaCo
         1nXYvmElSM+KsG7Hbqngk2z71gT+RTt8bpZAj17oZBEEXCKCVHpNwR1xttkU+07uWMoI
         z/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530204; x=1795135004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RGmNdmvX7GyDyj3rjdj61uFnaluwz5zplmLJm2EDWYg=;
        b=aTufMlxUG6YBCUWyVMGX/F2SmJucjm/RGBLC9GvnDHivGoC8vHUlsuQt6M7WtXUz8i
         XPnvhYE5RK6Gs8aTdsnYV1YQdKN8ABKSaq1TDjPdf2oPlvx0UAcrgjWELbM/dQ2SFgwd
         TORG7L/BzH+DNcTTaCNITeCmXxTv/bqUGwu1MUMRmHvUhZWdQAaaDlIdxGbIq+GbGsW/
         HSb7r7bIv/QDLxSUVC4D2L9sbu+C8CY30gjWSZ0QYdkpdwEA887Ky0im0sjsSVq53XeE
         qRb9X50gzFugyFSJqkKlywQJjnRVWqJ3AWrokGp+pVw0ZGDw08Jm0FyGZksH8P5bQKrW
         UZPQ==
X-Forwarded-Encrypted: i=1; AL+hErHiF5jeymtzKGYuE9h36o+nxixK/QYPLEj+WYuQFcSqGbaO58NalaS0f+/oFdW2/rVEWqGJrlr5VoUx5TXn6CmL@lists.infradead.org
X-Gm-Message-State: APuU4Z8MNiIV41JMFwQh7yZNhl6wbCMLSYv08tvl6dld0OG5MtMh3HhA
	/AkOHZDs17gQm/dke26E5LSLTfGufiTaGKN052nxApoPFjJ4rsZ7M7Do
X-Gm-Gg: AYBFou0m/YRvCOBkIUnJZTRtjBZOB1+F+j9Cd5wNfyo4XB3EmUEwgqp3xeGDWKLPumk
	/Y2/lCQKO7uCDtPD5x6iDsv6g1VmbPKyBNluROBrAOhyAy8oW9oufATeqCXJtUO3DtVhVZ2/7O0
	DyqwQkUiaf1yXvqViJ0VDVEAdRRGac4Dd2X+WRE0HxAQi8kpjM9LIiR/aVmYjBqtB3bn2VP1wnu
	1ZQKaBK8F0/LlkEl3BTBCr9h2UMvaS1KChFmGx4D2vIKFFpg4nOfKsDOoGlL4/bBzXHET7LBIvX
	7qSlNHbGrMUS85EhIBYBvosP8arAXWCqFRwBZPrjshmrpbmUOlEv2hIgQHsP/sk1yGP264IvLc8
	a2ml6n6O3TtmTa0rA5iAstEvODyqe0e3j5hy09sBz7iWoQhQr64vYy0srD1dM4q6NPrvUAAd/cL
	gATpeBv9DTinc1P4OIdx34VwHpKPM+lPkzUPlJ+BUjFWRlJNAL1cfu0+UU0JzsBUBLBq6J6Czfc
	MQC5jcMi6PCxpBhs9LuAbWwP0ChyvM5AXDduXwIM3T0SZjkMXRsF1T13hbEitDD0yUoPUq+TqPF
	dqn2Jl9+4Jczspj4jDagGfQ9Qp4IJNA/7Rrd6Z3ZFcnOrbT827hwDDpTC+wvcSLMw0bjF1T05Ou
	+ha/JQgL3IXmJa8hMpmXL3T/zyAcUkebmcxCwfBB7XKSlAUkmGtmc8zotB0hEtDzVuLfDS7Mv1D
	qn265tj5/yoDajl4yuVVWL5nEYvvLoxbbH5LELjg==
X-Received: by 2002:a05:600c:1906:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb55ac2a34mr19676755e9.17.1794530203716;
        Thu, 12 Nov 2026 16:36:43 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm3282945e9.3.2026.11.12.16.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:43 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Cc: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Fri, 13 Nov 2026 00:36:41 +0000
Message-ID: <20261113003641.3664652-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112072953.989664-1-isasmendi.agus@gmail.com>
References: <20261112072953.989664-1-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163645_632924_59BB4240 
X-CRM114-Status: UNSURE (   9.85  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Agustin,

I tested v2 as posted on my ZTE ZXHN H3600 with 512 MiB and an L2C-310
r3p3, running 6.18.60 with the OpenWrt patches for this board and
booted with kexec.

With the cache node enabled the cache comes up as before. With the node
disabled the kernel reports that the L2C is disabled by the device tree
and leaves the cache off, and the board ran 10 minutes of Wi-Fi
receive, Ethernet send and PCIe config reads on both CPUs together
without a hang. Like in my earlier test, the previous kernel had already
turned the cache off before the kexec, so this does not show what the
boot loader leaves, but you checked that part on your unit.

Tested-by: Navid Ghahremani <ghahramani.navid@gmail.com>

Best regards,
Navid

