Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B99606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 23:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a3DDCwJG;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HL8Sey2q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OoJVINX8BcnNTAIBKSuno+iiYgSzX4Li9L975jdSWfw=; b=a3DDCwJGRr7ElP
	9be/C3LebWbjXnN32pG6pMV1RcJlLnzwvImBVX7PXNGlMDo5QkDhn1YIP1Y2B3awnpLROf+W9rGDV
	6ET+/Cv0SKFBb5k+sk7tfLi5qxy90z66fj/qaU3gdHKlDC7cIix3ugc6QwDzwJOobE6yZ6p861ajU
	qYL3X4S8+6EnEgE0lV4JOuQEBTmlF4fsTtST2ZAvERk5cMZUGNqbXGviMbu4dI45VY7Kj5rhLnqZx
	e+yYvWoSnK5MUu5jApRWeGxrYq3WkrJCgQ/ZUKVuCEE5z5OPRqnFCmadG3HIuRVvr+RGKsQstGHWb
	6s2Q9Si8FaNQdG3idYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTd8-0000000DsF3-42ao;
	Fri, 06 Nov 2026 23:45:58 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTd1-0000000DsCJ-3BcD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 23:45:53 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so71237a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 15:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794008751; x=1794613551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoJVINX8BcnNTAIBKSuno+iiYgSzX4Li9L975jdSWfw=;
        b=HL8Sey2qS0dzR9r7jLRyMSdAcuffZAcHURdbIOa0cR7kSTG6UrPUG2T9eX4gaWuE2/
         oEB7/mqoUfKrujLUqpnUJqpb9fmQC8O1Z1RtYRZjPTmNZJ5jlrsKR8KsQZiWWgdZxAOX
         WUIB/EAxtjAhBFWjX16E+F9mGs6bdWwdyvPSIyOoJfRH9VACLWdeavPKj4gxFHT28uTo
         vrRUJc6coOlAC7flk3ibt/goQ91s4bNSxyxrIcqYubQJJhl0zMslT0EcZjivbDIsbTkd
         lNRkD6zXm7VlZagFo96kYMjd+ReoIIuhrPPo8Yf/GCOYb3UUBoPF35esec/ZlQrhPuaq
         tqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794008751; x=1794613551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OoJVINX8BcnNTAIBKSuno+iiYgSzX4Li9L975jdSWfw=;
        b=NqBbGneG+By9faQuEOnIpXGJdFImyO6/kJQLywNBbCREJukwBxtDJQS9JTxW3nzC2i
         MGYOxf2k7oCWVYkk1cIticFjoiVSJxoIXm2znrRXHTR/WktdAs8RkxtlrCjwVLtK4n9f
         4zUxXT/hUV8/TPkDVWJyYhTPGCmQPD5mywsE9Cdmoxtwt1vbym6CUbkRavhVLKr/9G4Q
         hql2XbtsKfyxWkf3ql1mUGZYRlRc7DlbHTkXfZix/LxjDYcRt/cHO5Vq3fdfGUrKFYkj
         prJLEWkQ2xmASl6kQIVh44XgjZnKw9K37DL7z5r4lSZH+utvs7PvD8K+gx4G/qDirHqJ
         Ejzg==
X-Forwarded-Encrypted: i=1; AL+hErGS/CAYN5vZFKZ1+tYQpGDhaqv5OL+ogcO6SZ1LfpsEkGoLMokzSty1f2+pbwo6JcTxgfFctC+X9YrhMClf6lCI@lists.infradead.org
X-Gm-Message-State: APuU4Z9+bPWWLsX/yghO2IZT8q0aBkklOfWEw8hKHIVk/lUbQT/vWUQo
	YBtydN7jzbLbVizp8S1w0YEV4DFVv+Y2/JgWCngR3j4oAeeW2KL1bTVL
X-Gm-Gg: AYBFou0pnP/ah2KOHWMjDpsrrVBFbvLTzgJPUMR+v4TP2nkW1Qj+TSK7JXc5Kc8DaqW
	70rHhIf0rlaaELyYyNBslRSBOZVXnxsuIHOe4GxDuVU0IvXomQD9nPK/gHDMV7Kl7NHoh6niHH2
	Ex/XoWXCDCvt61ximpuJeGZXO4u4kMzkdkSFVsfH2wtI7pAHruBQTXHncepn2M/hanp+Z/IfERF
	SvPvl8XU1D4tJIhmMt/77niuPj4GZbOA70VQOe5/xgWtQIRi1wsPF7XTmnc5JhFUcvB4Y8AeSff
	J+QQtptQMOmo5Jd9ky3BtjsNpfbS28ss3xuwY4JDbHKc4jwlK66v6+oPO2EPHdl8j+hJQKVudTu
	fQPLfzCjbon2FgETzGI0r0Pr9KPu1OPiN+zm5vwDgSVG56e2t7+cT98GPKOl3oB/u6cDc0K5NuP
	VljrNPdeFYj4YZvZ5fl7ZGerc4Aulow/nxXsanNma2jINVAkwX5YJWkxDJlrcybRXOP3AZ8pVln
	2K7N+nLBAqnZUe0kaMBJ65r5GgywkBySahM7g8G5rTL9op8vfedCIUjZ62jTc1wpf63ontaG9Cw
	21MkO2SU0GG9EdZZQbas
X-Received: by 2002:a17:90b:524c:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b10608181dmr328100a91.8.1794008750759;
        Fri, 06 Nov 2026 15:45:50 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058d3310sm715972a91.15.2026.11.06.15.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:45:49 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 2/2] arm64: errata: Fix Falkor E1041 Kconfig name
Date: Fri,  6 Nov 2026 23:45:41 +0000
Message-ID: <20261106234541.1474324-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106234541.1474324-1-takano32@gmail.com>
References: <20261106234541.1474324-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_154551_926727_6AB31E49 
X-CRM114-Status: GOOD (  12.56  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Falkor E1041 entry in the arm64 silicon-errata table names
QCOM_FALKOR_ERRATUM_1041, but the symbol is QCOM_FALKOR_ERRATUM_E1041: it
is defined in arch/arm64/Kconfig and used in
arch/arm64/include/asm/assembler.h.  Correct the name in the table.

The E1003 and E1009 rows name QCOM_FALKOR_ERRATUM_1003 and
QCOM_FALKOR_ERRATUM_1009; the E in the erratum ID is not part of either
symbol name, so an E-less name in the E1041 row looked consistent.
QCOM_FALKOR_ERRATUM_E1041 is the only Falkor symbol that carries the E.

The Kconfig symbol is correct; only the table entry is wrong.

No functional change.  The change and this changelog were written with
the help of an LLM assistant (Hermes Agent); I reviewed both and am
responsible for them.

Fixes: 932b50c7c1c6 ("arm64: Add software workaround for Falkor erratum 1041")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index afea5e57ab95..f554fa04662c 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -360,7 +360,7 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | QDF2400 ITS     | E0065           | QCOM_QDF2400_ERRATUM_0065   |
 +----------------+-----------------+-----------------+-----------------------------+
-| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_1041    |
+| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_E1041   |
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_1463225       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0


