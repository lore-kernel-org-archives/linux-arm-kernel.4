Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7051606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=al0uj6PK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vK1XpSpM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/xKm7gyCn60q+UftQgSFNSdwil5EY1yDb3KfSYz6nH8=; b=al0uj6PKKnwRJ4
	IwJh99MroJpb1FrfrMSl1X0MRKOCW3Y2G2fesFYh8Rd7lnSp1021vPm/EzYDhBy/Lns7BZiLGve4v
	5C+IREdjCUPcp1qqf7Xz2zqfLSsRE1Egb9e4Q+OPjgAEi2dAlcyj88OKI2ZFuOfZFk4/kZ0UYU78w
	iurX/o3faX7nZ5+4IzAgV6DoOkbCjUjqlQ18zWDonWyw6KNs2Zd4CtPs006ndLouCnAP1zlnDgUbU
	NrJtfWe4aoRMDYPlKeiW3MsYrZCpQ+1otZV7D2Rs0pZoNTms8SLE40oIZE7MwDSndYkRKIvkp9+ue
	nm8C3Pm9sjNxecdqWtaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVshe-00000006whb-0J7Y;
	Tue, 24 Nov 2026 15:45:06 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVshR-00000006wcn-0zDc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:44:56 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1b3acec6677so6782475c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 07:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535092; x=1796139892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xKm7gyCn60q+UftQgSFNSdwil5EY1yDb3KfSYz6nH8=;
        b=vK1XpSpMdX4bbk1Uw7ye+LX/ViED0uGL+MFq8NwZ75bPWEnsizmspyC+o62Anj7Dqk
         9Ww6Sz19rGksKTwVviYITNHVQHWC1tTzNFh8Z1WYScebx49mLOcWXS60avfAOt2YVJhi
         HbfXzU7CvhAn6btRwyzDWOKNukj/4/330B0ykT5/3BeYvNInKuBKZ8kXyWzK8qmtOnk6
         gJFP+O880lHlDYF9MP4rxj+q8TeIYaabTwitErIH0MsaMja1AGyKKMtD0/dfLe7JsOx/
         9JvA6YyDv7G2WHX/AIVUrmhgYabd3Vv7vCi7eMetJlaA4Xh5PBxVvIwZ913SNFtTM1hO
         U7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535092; x=1796139892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xKm7gyCn60q+UftQgSFNSdwil5EY1yDb3KfSYz6nH8=;
        b=mwcOoygwVLGjNTsffJ9rUEPAcUiTMSscXqH3j5zsvF8MmL3oXSQ6zeIzv9tshpa/3A
         srzO6NxAscY5N5IRvxZZXAdtZocAx/Ua8/eW55KpM3Vx1M1PZH1W2U6KOUfkQpZTNtgx
         cJ9yfjT5qh6UsG3akWlbjse6HiKjBgte13i/ssZm2dqx7V0SmqlqlHI4c1dh5UnCoM+0
         BQPGho03rJAfjLwcZnPdKHV61KuSURxlwT2tcLXlN33QONuEQbJ2+UO0ga3ZK+Ng+5W5
         tRx7kcF/KLHXslwj6GEL0s8E29Mblpg8rF0PIBZRUuL4rOnY12FKEgYKYGF0acBvtCDd
         ooeA==
X-Forwarded-Encrypted: i=1; AL+hErGZomHP40Xo3fie5qx2FQ4IgOa2u8waWkH08/leM8IX6KRxbn6mfOppA17RXHU4fVhj8f3fSYU+xVps0GEwo7Td@lists.infradead.org
X-Gm-Message-State: APuU4Z9nylsux5SllcMr7FTOuHCoblo/kX6wViCVz3HjTWfbazXczBev
	eBPN25a8AVZrdefMFc3aR0i57DWC3CJto/RFzcneiO86RievZ37IFbgO
X-Gm-Gg: AZFdTZc1TAtxFe0RvBIhcsWF2f3O4BXb0YqzpoudVanEg4Wh02MjPSu1ytWtzRsVX+w
	yVif4p9YmPeuvOcUKrG+69H9XiwxCt4xol2eU+1ST5/XrZEXV2Sdy6fOrCQRMjLl17xmG/0Azfv
	HUyZ3QK3QcXvD1O2r7YR8jbkXm+vp9mlmG1sXWl0bzY9p8YUYaMBKs/XdVxVjAwOulVBNXAwTIj
	0nyLkoeik6qPHEwoz4Y4uZpDkT4MWm03zMIQP3ECQ1GGJ+G5EwhyaXFp7RicYWpcJzoJ/1TfAaL
	uXOm5UBZ99vmVQEpTKuRHXjzEnCoHOinjwyrUQE9tPVGWoLarlu5Zk01VKDDMt8wWUg8Vqfm4u+
	/eTUpW6FI+TlUjNNlr6UJVB6hV0F60dUY6f/yvsGD2mLHf2bNfQrf0KmH6i6ip7LWEKUYZmeQUK
	OP3vZJGxKgq1GWhWkq5yXrlWAfRKYLMed+ToNKl4KfKk1BoD2/UE5CS0kMWYguY0nSmf1hoCzOD
	i+Wr+D+DCGaWSpanJXHJG5ukkjJuK4QFWPVN+wiWbvBI+d30C+xrsH42+bMa4Hk8KhdyiNVitBc
	/96s4BFhe5AOeLVbBb34
X-Received: by 2002:a05:7022:7f12:b0:1b2:4f97:27d7 with SMTP id a92af1059eb24-1b55692891bmr13960347c88.36.1795535092071;
        Tue, 24 Nov 2026 07:44:52 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm58746964c88.9.2026.11.24.07.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:44:51 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v3 1/2] arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
Date: Tue, 24 Nov 2026 15:44:45 +0000
Message-ID: <20261124154446.1094507-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124154446.1094507-1-takano32@gmail.com>
References: <20261124154446.1094507-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_074453_522652_B3F6FA13 
X-CRM114-Status: GOOD (  12.55  )
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

The GIC-700 #2941627 row in the arm64 silicon-errata table names
ARM64_ERRATUM_2941627 in its Kconfig column, but no Kconfig symbol of
that name exists: the workaround is enabled by
gic_enable_quirk_arm64_2941627() in drivers/irqchip/irq-gic-v3.c,
reached through gic_quirks[].  Other GIC-driver workarounds without a
Kconfig symbol are recorded as "N/A", as in the NVIDIA T241-FABRIC-4
row.

Set the column to "N/A".  Only the column is wrong; the row records the
erratum and stays.

No functional change.  The change and this changelog were written with
the help of an LLM assistant (Hermes Agent); I reviewed both and am
responsible for them.

Fixes: 6fe5c68ee6a1 ("irqchip/gic-v3: Workaround for GIC-700 erratum 2941627")
Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index dc4144ac895b..5dce49a57864 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -291,7 +291,7 @@ stable kernels.
 | ARM            | MMU S3          | #3995052,       | N/A                         |
 |                |                 | #3673557        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
+| ARM            | GIC-700         | #2941627        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | SI L1           | #4311569        | ARM64_ERRATUM_4311569       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0


