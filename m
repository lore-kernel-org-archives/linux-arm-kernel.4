Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF7C60A262A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aGs7KArx;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yrm2ipG9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yBnefECfwQcuojOfi/klJviB1+Jac8n9nY0eAZ9BFZk=; b=aGs7KArxV3/Syf
	kTdMLeHC+wZIJOs3mSwSC4FqZr2E1d+XL2AJHG/ASF07mCVdo4/svrQveareoqC5dQBKLHSYqW0NF
	ScPIhmY2XQq02s5+22ZcFvQ7o3JCDEt5tqKFj0tWXf9eEhrP2wNJDFB8qyqR6TB4Ne0KNTwZDM8Mi
	1zd8lZleEEh66yRnxYQkr2LipnUDEd8hkA6YPc4eatJ8wLEETCDodOWKZAu5DrHx/lqoEVND3WA/+
	3Z+8Gj8JMAEkbMoQFYcbRkgF4oYoUd3ihL6x1hkwBAxuqCpnmK9exTgs18+E+DY1PfEhpEs0jMgmR
	h6oO0Y2DnvokmGsAFH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfHB-0000000BKuj-2tG1;
	Fri, 13 Nov 2026 00:36:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfH9-0000000BKt5-015F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:36:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso3365675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530177; x=1795134977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBnefECfwQcuojOfi/klJviB1+Jac8n9nY0eAZ9BFZk=;
        b=yrm2ipG9IHZH+tHgZWrEduz1NbAiaEI7tiIOCQXjurkTWYN8xfIx+62cWv3AqC+CJZ
         dauSmyVPbTutl2Q6W2ly5CdBa858eNIsRe9H2eWxs/FbXaYxtHb8Tq3GWc9R/UoGpxOB
         gm/FOz700y6gUW55Omo473rpqNNSvBR5tOwXEXyc7NmhFySv9M+A6nT/DXNdthhvEZ1f
         ssYk9EIusfm7PIQiKFsRgwFYAMF4QiBfv0EzbilIFOBewsjPaLajWKT97VqEfpqfSC1a
         MslXPBXIB7BFAdchIEqH7t3zaUrvNBiMflno5U41gZZbiZzumWt8SD1a7BUI3fo6qyuP
         0/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530177; x=1795134977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yBnefECfwQcuojOfi/klJviB1+Jac8n9nY0eAZ9BFZk=;
        b=ZXg8YdIDx8L48ntp1hCMVsrQsYmJvHnrYIqmtZMwG6W9tAtB9WYRVIsroI4BtfQY+7
         d7+JTifLqHjHhlvEZq87lkm3JcJS8P6jJhzvbsMfdsWertGbzyEbpqR/IomecbyraVql
         73T2O/WLop0o5qyVfpvjANCAC+ofnEWtcJfFf6laEous/7vH5ReSMhVYxyBDngj3bzc0
         ITFkRzgpEQDGlDo7zsz0DF2GWYwGgEIvtgDL0m5IlEh1T1+DkaFVknFHMrBF2qFGhEYj
         GEah4wM+G3TlTYaAeQ3BIOp0eOGs/rzao68dyTLqbKBwuShUWWmCwhpYZjvE+NXJUfS8
         xEOg==
X-Gm-Message-State: APuU4Z8W4jTrnpbDVXPQPCftNLehAXPwWg7hp+xnNDQFp+5VDkZUzTm2
	n7UbCY6gaLktjFJZYUXfr2eeF0A9DwxxYEfErcSnouoAFMW8MIBIb3Tw
X-Gm-Gg: AYBFou0y6IooGfUy8VST0VwoxEh0tkEFwmshsh8XTqs6Ol9w/0ilauJKQ0kEmk0KJA9
	9TmnXuK9s7ZrsONWGNsLzwllAgAHPmJA7kSrgeagCgOHBurjvaQG2EV98VBQtKb7fH0bE4cOLgN
	BrxRxO0MkrH/QReCxzoUWPA+MELVi0Il/q8/WSCbfZRJUk3nHinA7/bmKxCvZJClcW1emt9S/hh
	ZXFub6tqVUzB8KbSzajsVnc8/iZ5jfs7BzERzZqX3sVMJKw3svAjoFRC4oVrZZItWhLihPShTVv
	+fSQF51/bTo6oWKehlOGGdYEZUkad1zzRtJz3nPMuNl58/j6coAiNq9/BqeQC58QhfkMLPTqets
	mKhwGrVExDS40FzRkIrEZNYW4BJcn7qFlGX58QyDv/8Y/RZUk96Pwl2sqHqagmcqLmjgPtFPWzs
	X2Dx5Hfpq3taASf4cXnmWlF9IAQ5HYShQKF7d6lPj99UgA3w3gIxByBslJsAQ6HlR7+Q7QW9+GU
	g8ykyFyjwBhkyNRg1gD69aS0VQfxkcMMyS+LcrJYkiedZstmzq0iDBeSfwNcfpuM/QjPy7QlLP2
	jwuVBDqCzDu3nPDJLU7RMIcxvEgsuf+VvkERuXvS4z4xhExvRNXlHWxGal3Ex+NiJO4mDXDJmNz
	K9PWg9xnCJeKBUluHLm+F8NPbdV23VydX0vUPcbj4iFzD5y8UzdPE20NV/cUU0GGAPMugstlhPC
	Btarz5fuDfH0K0AUDO
X-Received: by 2002:a05:600c:4313:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb55a83305mr12734625e9.34.1794530177039;
        Thu, 12 Nov 2026 16:36:17 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm1812441f8f.27.2026.11.12.16.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:16 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 24/24] ARM: dts: zte: Add ZTE ZXHN H3600 board
Date: Fri, 13 Nov 2026 00:36:14 +0000
Message-ID: <20261113003614.3662958-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101307.3936492-1-isasmendi.agus@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-25-ghahramani.navid@gmail.com> <20261106101307.3936492-1-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163619_053456_65E06751 
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

Hi Agustin,

Agustin Santiago wrote:
> Does your unit really have 512 MiB? If both sizes exist, maybe leave
> the size to the boot loader or use the smaller one.

Yes, the boot loader on my unit reports 512 MiB, so both sizes exist.
The next version will describe 256 MiB, which works on both, and drop
the pp node since nothing uses it. A comment at the memory node and the
commit message will say how to use all 512 MiB. You can enable
CONFIG_ARM_ATAG_DTB_COMPAT so the boot loader's ATAG_MEM sets the size
like on your unit, boot with mem=512M, or change the size in the node.

> As far as I can see nothing in mainline implements the cell index for
> "mac-base" here, so all five ports get the same address

You are right, nothing in v7.4-rc1 applies it. My unit has the WAN
address at 0x36 too. It stores four addresses at 0x1e, 0x36, 0x4e and
0x66 that are one apart. The next version will use two plain cells like
you suggest, 0x1e for the LAN ports and 0x36 for wan.

Best regards,
Navid

