Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5F6606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H0KdBBD1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ReUgTB0r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1Bccd4yI3pD/JL2nU4bdQ9YmhxrawFp7wADjDHuJ8nQ=; b=H0KdBBD1wBbQFJ
	KMRQa6HIjx/H0UDyC37uXdyxQc11g3m5IuQux1ZkWmbGgCxx6UuLe+cSfHDm6/9dNji292o9dyLN7
	79SzSg8lH71qDNvHAp5jVHcV7Es4xAt54PMyNnA3GIc/VFtyjmXMYq9THvSykqzWWjBKZJq36BKv8
	9qJ0YjRAJQS9/cXxiXwlzgbhvPW+l0IuYTbBDHwjcjBNDiqWr4u6I7P5aFIZHVdtgS9mRAR+DUJg7
	y/gtUWJ5g9sSyfj+oq7QmdWM17AIqJ6/pJYb9XgAlHTyEJ50BZ7xsd3nq2CfcfjBiRZ681PSEkYrQ
	37Z/3k11t0ez/oGPD1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfHO-0000000BL0E-07bH;
	Fri, 13 Nov 2026 00:36:34 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfHM-0000000BKyy-0MAZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:36:33 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4919a880834so158348f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530190; x=1795134990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Bccd4yI3pD/JL2nU4bdQ9YmhxrawFp7wADjDHuJ8nQ=;
        b=ReUgTB0rV9Oe1Wg0bt/Kb48zeBEYXVEC/w/+Nn23mkTsT8utKD8ykoXbnn0QE4EwEL
         Unsg5Q7qo87SpeDw42ZNRclE6GCSK6BCqjQsnSPjpMhXJ6gBlkMakJxH8P1M/Iu8C0Km
         QQLZM57t9AZIWrr8PC1H0HeoSuY21fAes6VydSBwMfBwAVMJvtTixbXftJsuCfwmkNCE
         4GTNuM4yko1s3xytej06kx5zngzjVgj5xs5f/WSMTzlGHrYeQ4qEijDnuVvY9rf2Ts9y
         CRhB0PovNt7GI1kyaJBMPPVwZaGiRN127gnViSIU++D7pkqN0pvy9hNGF+wpqMDkOlBj
         zwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530190; x=1795134990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Bccd4yI3pD/JL2nU4bdQ9YmhxrawFp7wADjDHuJ8nQ=;
        b=aP0nCj8zsUhiz5szor0wMaP17VFqxp6kKjQ9AyPuVAmlYyVQ+9o2vnxLn1sRS2j0rk
         yVOZoaVLQKeAOKBQAVNZQsp5+5AIjVmEjBpX7sIIVfkzP/KsUoT4onC3f7sft3o3s13f
         iG8gsbrA0rfobO3j12ricpPCLmsKXkeXA5hoYCPuqhMz6vJxAY4+QSc5YOgAB0t09dQ0
         L5WN7f8Bwk/p64IYZfcJKBPxJtYokzXr4V2aQkELlTn1IL2Z/wf2oNSQiGz4qi1gpCNl
         E7pJ+OGsFNNI3BhRmB3k9WZdQp6tySSdqS9oP9INwzIc3HrABQVorItU+v9LZSEju0uy
         OIVw==
X-Gm-Message-State: APuU4Z9b0xCSrBnqzXDYcOFs8iPD6YA1Q7HjKy3HFyTQGpgxn8wmmGO5
	LXd8SPb+Wh3q8hD2tmHM2glWthhYEVeSUZX2P6ea2eU+wAAaiE/ShJka
X-Gm-Gg: AYBFou3LI+dTBVHgKvSokhpoT9JeNnS8c6iHhgGSJhcbvbInkWl62CShJXf2Sj3WbZT
	Ut5R9yONoP6AWrrvQIMEvbwR89n7ti+ha0/EKVqqIOQyjGG3t2hysU+mjfYPvRXwCOZ0B3jKbgE
	xxO5g1dfNIx42svMg/tZP1WnJigTLl3zNXj3ILFall7AKstXLJjZaLYXyCkghpSpvHf9InuiGeq
	EcrlMFGXY13PgB4j/LpvY/gL1ptH9rPKQxVNuDW/QJwogSMniHJtrvrCkgXNBQb5SIk7GBP2zJl
	ufYIo+9dXpQfhX3eZA+kKcjzx0UoKw4XQpnxpKNixHRcUSCACsgtJdwadMFAvMo2fcbxRi11fYG
	ea1JJhzqb8dowDBPR0kt/j3jCR8xkuwPMjPl5AD/2Y29Aq4kJvA8RPU5AcEcHDWoAYarNqRXfPS
	lkvaF7sLCW/XFlviLQYOJevXWYjeMEJTgdGRtNLyyU6dB70KFuKcTdruZjpINruR8qyezbK7sAW
	wCPBeDH813bR1Q0J0aph+SHms4Am673+brEqm+lqAC8fvf/+wYnIne0nSyNaTyQfjTGJSQ/Dzhq
	4s7+BvHl7IKtfSD/k5/9G8FUhMkGwHkd0IrXf9hSmNHPqBnOoccn+89gcql/CPScWH0oTuAmYYC
	vIiKwcVNDYGTVIO4KN1w8gXih9IcLYMZbveS4Okf7lHbVr7Vbak6Y9T1nkamCit5AgkSd5TWx3+
	vkS+cD7dXrcC8qtrLWHQ==
X-Received: by 2002:a7b:c00d:0:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4bb55a8a57dmr12295015e9.35.1794530190266;
        Thu, 12 Nov 2026 16:36:30 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5671059bsm7706615e9.1.2026.11.12.16.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:29 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org
Subject: Re: [PATCH v2 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE ZXHN H3600
Date: Fri, 13 Nov 2026 00:36:28 +0000
Message-ID: <20261113003628.3663821-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101123.3887079-1-isasmendi.agus@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261106101123.3887079-1-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163632_141750_6AEDC456 
X-CRM114-Status: GOOD (  14.60  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Agustin,

Thanks for testing the series on your unit and for the Tested-by. Most
patches change in the next version, so I will keep your tag only on the
ones that stay the same and Cc you on all of it. A test of that version
on your 256 MiB unit would help a lot. I replied to your mails on 11/24
and 24/24 in their threads.

Agustin Santiago wrote:
> - Clock driver: Stefan asked for it to be data-only on top of his zx
>   clock framework. I have a ZX279128S driver in that form (based on
>   clk-next), happy to share it for v3.

Yes please, and thanks for already offering to send it to me directly.
v7.4-rc1 has Stefan's framework, so I will build it on that and test it
on my unit. If it works there, the next version will carry it with you
as the author and your sign-off, followed by mine.

> - WiFi offload: on my own driver I have the WiFi path offloaded to the
>   packet processor (the IDM rings between the MT7915 and the PP).
>   Would you be OK with me porting it on top of your driver, as a
>   follow-up series once yours is in?

Yes, I would be glad, and I see you already sent it as an RFC on top of
v2. My networking patches will change before they go to netdev as their
own series, like Andrew asked, so the RFC will need a rebase on that
series. I will Cc you on it.

Best regards,
Navid

