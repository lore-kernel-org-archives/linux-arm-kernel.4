Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E53606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 04:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jKzT4zG7;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B1rlvmGB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N1T0evME3yiI8dB4BC7sUR9jHQxNyppjV0Y1RlmSCUc=; b=jKzT4zG7493dAq
	e5Sm9ahOrGAQBXbZFakl0WXdrhzZHAMLhFj/BaMxNFbKPcNOfym3/3Hr/a7xw9BSmvZegb6agrIXh
	CYZc9dBe+aYoUBYMWMT2g3dJ3tImQX6Hct+kmDC4ZTaGRvpsXzMayBtVdefYTm3WU9M3hZ+I+dkJR
	lRiFfgJwAbC2t2DKb/fJTWGvdjktjv8WY+udAuDg36nzu9ZBhXrdCaYePBvJ/hS/me64cV1RP17Wd
	pQ6u3Hr8pd2b1EJ2mobATxSiG0D3EZNpRATpIhSmyhB3o8F+NuZeY67l+D+m/EpdAiJ72pv4Nba69
	0zAIjuNm4VxY9OytwUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWnjH-0000000EvNS-1qMd;
	Fri, 27 Nov 2026 04:38:35 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWnjE-0000000EvMs-3pFx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 04:38:34 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8669619c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 20:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795754311; x=1796359111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1T0evME3yiI8dB4BC7sUR9jHQxNyppjV0Y1RlmSCUc=;
        b=B1rlvmGBtcEFTOrsFt/ZO+bn3L4xoJvcSHW3064d2r8Gi6aTxSiF1AvIkwyzdCKJN7
         hrwzqyvilaxG8GLyeJvmwzZ5XLw9gj1et1ACQYQUAUCKtYj02uya1U9iFe4rq8+RXAOi
         KvYX6oG+fotUYjFzlXxs7zRaPRCIN8aZrFckLmQNq/2u12JnOyp/zGVNBHpUViK3skJX
         xbaVyvLjrYjdvK9381WcsIm0FEXAi7Ia5KLZzFUgYAaUOQLrPhuMPoAUHY++s//2BUWW
         Qp4o4UNDY6cpcNvKQ3daUHLdweLgtXfyS1KRf+pS4urNHxRFo8w+5Ofx/8jSuWbIUWFS
         riWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754311; x=1796359111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N1T0evME3yiI8dB4BC7sUR9jHQxNyppjV0Y1RlmSCUc=;
        b=DHJTLRxGK1trr/t1lhIAqEEi+bZ6niDNkYhQkLa65DJ1TqZExstXOuENNonmbdwCJO
         usOqBM1mTbbDK6HDNttQO3P59QXEVbcn2N1/9K+tHXJ3JOF5qTfvDuV3TdCWbYcDMXxW
         4zKALmJ49iH/sRLZO6mzMu9Am1kDIp9ZbXrhLcSciOamiKTWPRfdOWMnxIIV3iGGZ6Ee
         d14b4UHOJsl9pL8VVdjeHeWgGjJ2/WYG9ukcFO52w55e2pjmAtBY7Z8Id2C0F1U1IiWT
         MJayM3DTO83XUZ9neCoaQ6U4487NXAuji8J5YRQ08LzoIdoui2AK3cToxIKeYETtT8OB
         p73Q==
X-Forwarded-Encrypted: i=1; AL+hErFKM0C8YNMjGi8tvtV1IShOGPk5iKOkZn4EVd90D9fQwKpfP+X6SQ2rY4L/CoKHqlzP1MriKo4MfwpPur0noBbS@lists.infradead.org
X-Gm-Message-State: APuU4Z815u09j29NM+4lZTojJzbIH/s6g5iZF939mCDTJ2Uis2i387us
	MkLJsmVqjZXfGkvCfVowklZWYMYg7TJtGmaEzRtaw33gOnOaEmZP1zZnYveh5IKpRg==
X-Gm-Gg: AZFdTZc9zGcH6eqchSYFACLWtW+y3x9gAtBJWHFmTyOJI+C2okc35jy7QL7CWnpIJ0+
	NejZkkqrYri2qb0dbSK7YGmvZjjcNwfuxxWAXORXQodVtekhgHnwUQlBsH9+5192XXQWdonUOsQ
	mFdd2sACbH3vYv5EOFq3wf99+76vSg/IKaoCQhdTeNAu1hpWfdWmPzK4XP1cFg3EQXampzZysOU
	ltFit0qPrarYDd48sy6oHsr6gKDl+gBJPU2h7YxlHAr1QM3WsMUTKP5NmHunJSs8yvv5E8dG2ht
	bOosriGn+GQlCjv6Dcm6FiOo/xjg9BxGPqwucuwKtecxqZ4S8+f4RJopJ17KNbHyYXghyZK+1ch
	59uTjAuh05yzjQ6otu2e8piZHcNyLTENwoZsIGRGb/0LRgYp0ynPaiiQ/hyecoU0aUNa1IcRI/8
	6WRqblKgMMGwNfDAyJ0P2beyDJ/1oykxhtCDy3CJ4LQilPiZ6iJjENtfU0q7mkQtlhS6HNdWlHi
	T69kx3E56nofzv53RSy/N6sETVLgoyxGYXDrsoR6Dcrpyb6JKvLAUvtTXUQCgtPHUruCXk2WBWe
	jhxxQ+PPiIaFBxIK1mYyOUUxBfGOTtcu2KlFuPtD9URWheIh5Fjvx7ES4t8dJKinWcJPhVsChFF
	+Y1sBjENfLC4vUYZFdw==
X-Received: by 2002:a05:701b:4513:20b0:14a:d8fe:3390 with SMTP id a92af1059eb24-1b5568cf65bmr22258739c88.32.1795754311354;
        Thu, 26 Nov 2026 20:38:31 -0800 (PST)
Received: from cantal.lan ([58.136.75.118])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm60732658c88.6.2026.11.26.20.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:38:30 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rohan.g.thomas@altera.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	alex.cramt@gmail.com
Subject: Re: [PATCH net] net: stmmac: dwmac-socfpga: disable split header on Agilex 5
Date: Fri, 27 Nov 2026 11:38:25 +0700
Message-ID: <20261127043825.601200-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179574936116.3135.3699981290049268393@kernel.org>
References: <20261126031300.211248-1-jjc@jclark.com> <179574936116.3135.3699981290049268393@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_203833_046642_FED805FD 
X-CRM114-Status: GOOD (  12.93  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 27 Nov 2026 03:16:01 +0000, netdev-bot+sashiko@kernel.org wrote:
> Is the root cause specific to Agilex 5, or does it affect all XGMAC
> users?

Probably not specific to Agilex 5. When the same failure was fixed for
Intel in 47f753c1108e, Intel reported that "according to Synopsys IP
support, they have confirmed the header-payload splitting for IPv4
fragmented packets is not supported for the Synopsys Ether IPs":

https://lore.kernel.org/all/20220428015538.GC26326@linux.intel.com/

So it looks like a limitation of the IP, not a bug in the driver's RX
path.

> If the corruption actually comes from this shared dwxgmac2 header
> length handling, would it be better to fix it in the core instead of
> adding a per-platform flag? That would also let Agilex 5 keep split
> header enabled.

If split header does not support fragments, there is nothing to fix in
the RX path, and Agilex 5 cannot keep split header on. A general fix
would mean not enabling split header by default, which would affect
every stmmac platform. Agilex 5 is the only XGMAC hardware I have, so
I have done what the other seven glue drivers do: disable it for the
platform I could test.

James

