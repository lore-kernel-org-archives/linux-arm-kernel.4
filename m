Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA79606B7FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cm7mz2q8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n0dnYCgk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=buBIF7EmYxWS5c3FiosEHjgky31TJ24TLg+DvfDgPio=; b=cm7mz2q8AF1xHl
	b7Hm+5HrvzcI8aY4vsd7iuGdTCMdn01Ey6q3bHCxcrBKWFF3mFqYVuhtPq0ijpWZENFVuTVwf0rMu
	gi71oifnkrtGSX9zYIu+xKk/fmfwJC1uOvE5LBoVUgPbZxP37WECeFXLtYsvHAyALO8riT6TpVoAg
	fjswL0Sjh9wzNXEaKdtaTJAcVBthQ81Rut00sp/uqwodUfgnyxwsFYgFHKWB5yUQNu7AVladpMdq/
	eKG9fu+xHDDAz1sJZYAnr9EteY0wzWE/lp91cXl3Tf4Lae3c9Rn3kG6oNHpCfMVDMEAAjSkhU4xWv
	d9adGjKq5jZqUr8Z/LFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfJE-0000000BLuN-3gfD;
	Fri, 13 Nov 2026 00:38:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfJ7-0000000BLq8-18D1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:38:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so2642345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530299; x=1795135099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=buBIF7EmYxWS5c3FiosEHjgky31TJ24TLg+DvfDgPio=;
        b=n0dnYCgkxCEBIYmH1H9kP2sat+k6WmaV/N8MqPfECfLNxYFRLw0sS8Dy2tODSMpsAG
         VuetR6bHaWLP4ZMgqdarDIqNqhvY9wVpZpjyR31EW8ZptuvfFgDA+uL0DQHnKRBf9wdu
         Y2bC+Wf8s8Qb3CSXcoXp1DRvcebQjl6ktHtL5G7+rzneHd4kzjZQpcMXE9ucuKDkUiAX
         Gl9Qx+0Foec0pYl19sTNM7OfwK9+932IINR7zze/qZWktVIi1QOs164+FTKEgurVl3uy
         nyy3B5Z6m0YPdIJNUkmlC39EdPJH7ua3GbyH/ZiAtJ8/mllTcxSHe9YFhelCpg0h8U/g
         9IEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530299; x=1795135099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=buBIF7EmYxWS5c3FiosEHjgky31TJ24TLg+DvfDgPio=;
        b=qCd2GTuqo8KJWNx0uxjeLRdSKEvjzxuh9WrttyLlndOrHE2edzwEu64qSyRipvuTuk
         f7lOd3t0Sha+FbaiKq9+ne7uXRkxu3llMSX8TtiFFY9e5iocaOfQaruBMOh5qODG/sIr
         nSsRnLa6eN8PhZdVa+d4VHSbQEVIZ5CwhwpMe3xSxgj3MLmECeKKl9n1TVs11na/mbT1
         KSZhOnS1Kp/zUaT6pLLszWgc6zRCToqd8x3inYa1P7B//N5AY/4eTR9MxdLkzCXuwbmE
         PN6TtFuV3UJCL5cWq3nUc5sM4dBwZntBlXtp/0QrWDAU4CQizoUzota5ETLdz1vzNTcf
         o7Cw==
X-Forwarded-Encrypted: i=1; AL+hErEiTrZErwaa2HGQ22anPSApQsGT0Smo4na0KJbvzTK5UnSVhvX8/QTGp2Bt5TS8rbJKevZT+6OdTjlt37eBRcyr@lists.infradead.org
X-Gm-Message-State: APuU4Z+5CmLsCpeC+42NPUdPi0QjY0k40q4KuY2Mh5IOqZfqaerDeKcd
	1ZgaLLlHHQoqoq4AqZazNFj5Lc33szh9XSy65B9qk4ZnzfhOXz1rGU+u
X-Gm-Gg: AYBFou1CdF/aXSyx4Nsa51pt+XhfPLMvAEpI7p1iEQz0oWS9x0W/EFfpfAMDUkYdXb8
	KDGT8r9S6XOv5R1eHQoNvQHd0OGe42IpU6Aty3nyUcJs7QE3M8M2tuVljoJXO9cf5Po2fIs66fF
	yobogLSVeOJ2dpO2prd7aPM1kBvlK+oxy/ffD4WHizpXW0iv7UhvhBHMpI8g7sC9IXoOrFNBcYN
	MIfASoy0fRFwu2JsxnlS6oITM/q9HzuTZr6u8ba2HeMNQISN5xACqSsAdmxWbxUc9q2hB1itUb8
	NCToPgvtu9BdHCPfp9R0FSBj5/JH276M5qVkSmxzj7WSXzp9seQQpfUZRDB2HMGHbTv6tIj0FVz
	SzqLBsC+F3YZTVvIJ6rawC6BGlKA7/vUaYLNxpaT+kEwYO0Gew27ErYa5BEmXXDNPeDPUXE5tjh
	43Jnzu/+Eh++ccBD1DZNZnvScTBgtBnQNv8PSAAalHNBbAwX0BM0+BQOZb8Rpae1bFFYIoGP1rj
	wzItQtD8t5XepDbMORMfzsBXyHhmheSb0pGNj609wmSehBxBSk6urb/j1vSA6rcEQzV28usORBJ
	ZqAs2LtDY3IOl9JR6O84+O4FpIH36Mg+Ro4kyXWG1LIK6xiyoMO+1eRekiYDINeRyHOd+mxFkAD
	vFZJvjLUJUZGQO6n1ulkNlvKb9249HCGCKg/Z6LQ+ZodW9nlvXdLJvxgGSzAvl7vY4+Tnt6ZFrw
	KUwXQvmLoGzvRYBxMK
X-Received: by 2002:a05:600c:4686:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4bb55a68395mr18872785e9.16.1794530299437;
        Thu, 12 Nov 2026 16:38:19 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm17084015e9.4.2026.11.12.16.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:18 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	robh@kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Fri, 13 Nov 2026 00:38:18 +0000
Message-ID: <20261113003818.3670423-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com> <20261010130024.177503-10-ghahramani.navid@gmail.com> <aV_PM_GzRW6aLmK6NF7ttw@gmail.com> <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163821_317650_A23C2A88 
X-CRM114-Status: GOOD (  11.69  )
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

Hi Linus,

Linus Walleij wrote:
> I think it's easy for an LLM to port over the IRQ support from the
> old driver to this new one, given the code is already there and
> this way keep the best of both worlds?

Stefan's board has no GPIO IRQs, and I have not tested them on mine
yet. I will check whether the IRQ registers of the old zx driver work
on the zx279128s. If they do I will port the IRQ support into the
GPIO_GENERIC based driver like you suggest, and if not I will say so
here.

Best regards,
Navid

