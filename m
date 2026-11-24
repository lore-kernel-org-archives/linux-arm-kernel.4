Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BCA606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 08:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rwK2hUBQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ziRWaNlV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ImrZa/CtUYdIECWeql7+P6fyscSC7J3tVy4vOnUjZhA=; b=rwK2hUBQmccHWP
	DxyYFqybaYt8AOMrxvHjuQMvmcyWCqhpkaRuHNwMnBg/2Y17Pn2k8Agd00LVhmI8KHpz2zd+7D7g3
	7vS8OqBVwX3U5aOeveyn39ksVVrD+O0U6nAi2tbiIM4NmulJtHF4NiuOQRw/vBUyP9Dkoom6Z/4aI
	TzqjlV7oAkMau6jcqf9VAmAHJDjWUsfW5XrKchF698HfAtpGxAPlSIQ4BOG2/fxeF3IS1gdqKx/Je
	XygOgxGqgjRkntc0G49sWVQ1ns0Bigmybv1xXm1U5hM/e35ZDA8A3Q1UzcOOvSi5pfAjizimMUnOQ
	7pp30C4IvIsKLYEsfREQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlnf-00000005sKd-0wiO;
	Tue, 24 Nov 2026 08:22:51 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlnc-00000005sJE-00EQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 08:22:49 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5be47aa555cso5241489e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 00:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795508565; x=1796113365; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImrZa/CtUYdIECWeql7+P6fyscSC7J3tVy4vOnUjZhA=;
        b=ziRWaNlVXE89wmSe05lxhirY+DYlFv/gDt2fwzvZH8udm5c+GVMmt0C7mKUMk4KuzJ
         j0RzKMLo3iF2jdM+N59vlIHliSTfjuZzpGxCh0j0bgo2YiJ+Dnbyr0NQu0kIXjIIVx+1
         P8fAXe6gM1fBko0zn+7XGxtFruAmvJdHDjPpsLouHwT8IuiFxc92g4/TV9TXxn0H5xd7
         ybTFZNvTToETo3y2e5BNdwmton5qb0Rnulu/Ja45pSWEuhS+xoy5UNB5/oer/rsZh2nj
         dHCm6KKycYenCnuE6fbKkoLLWR3u+3BryI0o2tWRa7m/YiLfRT7Q4VSodH2XXq2BxqzE
         nmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508565; x=1796113365;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ImrZa/CtUYdIECWeql7+P6fyscSC7J3tVy4vOnUjZhA=;
        b=u1lxcJ9Da7ODEJTKALGHl5wPHkfg2nyQjcupR9KLx5UefTSBfHhvSX66nSMsX8fgxs
         mDtkZlYJXXZ9WXcMaqVa+VYMG0rHJchqQTaILY8Nj8nfAq6Ap5aCRpb0ppW589J5oZkL
         9y12H5UevV/aVME/W2Qjb5TKMVfExLJVhfGs4GI0o6Ts6N2XrH36IkWSxtm1TobvzPMW
         ow0TU3NRcAiV2ox+frh14zdsBjVR9TGB1gSJaf6U0FLZAwv19H3W/jWUAPSRW+QtmD3k
         cwIM72iUlRnVXsGBSi8WEWQcqKJi+Z+bSD5rSwIaDLiGGqqC3FaQ47Wg9ib4Zzz3Hju6
         VS6Q==
X-Forwarded-Encrypted: i=1; AL+hErEzhayO22bNJ0zFt97hUaM2dw0VS7tmd4t2cI9+wlQYjqhX+5RMgU+m4sT0rxFyveNeVB0pdujRnZ3mAYDm2NE/@lists.infradead.org
X-Gm-Message-State: APuU4Z/wOPmSExZgjJHrLPswCjIzwjCQkihEAuVNG2bDpSoXNQrEaRpg
	2ZwnBqzziI6UdAA0e1yybyC1AdI6Gd0C23JvER4bKPl113jTWF3WAzQ+
X-Gm-Gg: AZFdTZf4flDR4WEDxSQpFMLy1UVBg2TUhkkZP9quz6FFcH0ezs3aCKgdapppkock1ER
	oT2E82v/x4Ls/B7iGpCP21B5XVIBSr6oy09+0X01gTPtgmdmYny1LaCEc9GgXvDnkoZkupcdaZ4
	gUL0wqUifQEL0ut3qV+0eGiQWl26i6iFTXw+Ko2qIue8ObyC2eTs4WAgJBl6xsTMlU7pxcva/zF
	ZaHGeyhgraM7vliDCM8NCcTJoqBn6VOX2VrTSGOYbo11nT3/X9vAT0QokuPOhUoqsR6cmO0f1GQ
	0+9LSiv2wYNkdTqwcZo/6AEeVNnhxCoO0OPrZilz/z6CZm1sQkXSBvOgnTE2LpWvpnrHnl99Pcl
	Y8AXMEIfpNJFrxbixDDffWblH38mU+O2CmUnAjLhOxEnJTuFR8tOReqdyjfwwy7jvuWqjVPjmCv
	bVItG6trm+MyAOVwAfQlmz0E3sdeLcPS6PWDHh7xudkBpYsus34i53lzz6++7LxDi4ow8GOZ9XP
	nwGcYhgYGhZH2jF/XGnMdkwFqbcAm7XInZIN2Kezp3kiiynJEsexz3C550T/SvTPUj9Rsak3YOe
	Fok+Ax4buF/QgYLLVYbk7Wm2s2HVzvDbovbIu1R/hWV1ZH/Zm7EtUgY=
X-Received: by 2002:a05:6512:108a:b0:5c1:4e18:39d7 with SMTP id 2adb3069b0e04-5c1bc7bccd9mr4434489e87.12.1795508565068;
        Tue, 24 Nov 2026 00:22:45 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0563casm3560147e87.67.2026.11.24.00.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:22:44 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwrng: Add Cortina Systems CS7542 TRNG driver
In-Reply-To: <awU2-KjkZB7WvqfX@monoceros>
References: <20261123-b4-cs7542-trng-v1-0-92d9ffcee531@gmail.com>
 <20261123-b4-cs7542-trng-v1-2-92d9ffcee531@gmail.com>
 <awU2-KjkZB7WvqfX@monoceros>
Date: Tue, 24 Nov 2026 11:22:01 +0300
Message-ID: <179550852171.3.3520172407021510093@gmail.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_002248_049760_F89B48DE 
X-CRM114-Status: UNSURE (   7.71  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Uwe,

Thanks, I removed the redundant linux/mod_devicetable.h include in v2.

During the additional source review I also found the vendor's A0 reseeding
erratum workaround. The driver now checks the global SoC identification
register and limits hardware reseeding to CS7542 A1, rather than adopting
the vendor's RTC/timer-derived nonce workaround. Our Almond+ is A1; its
identification register was checked read-only as well.

The built-in and module ARM builds were repeated with COMPILE_TEST=n.
The A1 generation path is unchanged; the new guard and its error paths
were tested with the actual C code, without claiming a new entropy test.

Sent v2:
https://lore.kernel.org/all/20261124-b4-cs7542-trng-v2-0-0192937b44be@gmail.com/

Thanks,
Fil


