Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB4E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TqAs1HmI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nv+OR/0d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=; b=TqAs1HmIc7k1rhWUQTrptGJ6vP
	saii7hEl7qHjb3ddrmSx48z0XfzcJilU4dGsR/+y448ICK2T14j9x/1C7BLsncx/nRtj2OxILTfXO
	YLa55j5l7rSEU1/0b5jjOOtvW7kyDGmocZDcQmddBZKD/3O2faFk4BsN8/hOS9LW853Wj6fTaCINS
	qCrsJPGLmxp2GPZ4pyDlrqsvShKhBWFaSW7VBqHZ4BNvy0oH3R3Gx7+owZkicaNfGBeYCD2wS6db9
	EruuyCr2nvXvSVZPj1BdA09dCtaYkSCUeQ29ts1T7/+5lMMryHTcgyl9+ce/4V5HiZjTJEXWZJqSZ
	riD854Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdnW-00000002QVO-1eWz;
	Tue, 10 Nov 2026 04:49:30 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdnT-00000002QV5-0eyp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:49:29 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c434376dbebso302190666b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 20:49:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794286165; cv=none;
        d=google.com; s=arc-20260327;
        b=n0FLwUz4SZFN627vCtNrID4QVrbLASyL54eNN0lBfaVFVUOM53Y6D3ECRMr6OloxsK
         YuaORpzJCkmLZYXkS2kvd2ZyyEIacbD3y5z3mvB/3Em4YWePZ1CTj2EhPMCZr2Me/bdA
         rxKeHpk0jA0GT6JGnbFUu+9etmHomMSeql+SoN8ALf9Y9WePqnPgphSEdet3rcBDe6V3
         wZt/XJ6QcKk7JHquFbfVZd0p/cOJ8pBcL/domtLa5+vy3kdmVViSay5AWZfzY4YwyxW6
         aZWV2ZzJU5pGcTdirNPNcHSnvncjZbJYhfOanEos0eUCJly+A7s2OvAqhGrtsUgE9m7F
         MXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=;
        fh=bl5sH66QvESih7VBjAS1EtE8ZTjPAxsJZ4Y9GVc4vl0=;
        b=o10DmJ3lTrGGgbcevvfwR/tJQU9eEjQxBsRdW0aIgci4FwgSWRb4BthfokvwfHihop
         biIL5b38VMFppQYPazNKCmubTWKygqeHJ/5Kya5s/Daflwf2vmcpc8swxT9ldxHg3UHo
         BKyOMTsL8wgdy8AjIMMcj4vyxPn/uOICTCTG7wvbTbvJ512zvK3TuDgAyvl/g9eKqF+j
         9g1W9TwKws+X0B7emvGcqQ3bHeugas0b1s1xLnpbpiFfFhEq4YHpIMDwZOdhJ1bVl0gc
         aOFaM+rWEgRMVECw4ajgUYlWEwLiml1G9aEAQPPbIGeToEq2bXSScwspmiKeZ74aebD1
         070w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286165; x=1794890965; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=;
        b=nv+OR/0d9PGqjquQ+bGxg289KYxPSf6LrY19wJbkCWYGzu9nRwqQNzmhaNfk4hnM1n
         aIbY5Y1AeKQTVVuBQsBv1n8bowLQMRCHKJ1PTuObJWCDKHvXnknZjJp27XbqDcdHdSXg
         FZn4uFmnvxk/rBTWDDjbi0Q9w+u86AMX79b6mmmlKuYyp0WerHAbSZpX66iu4VWVCInV
         fj6QDjmzBRGmtJMpAby6jiy/NMstZ2DzfQbrnwix9bwn8z3ClIKrZcWy2v7JAw9gOlFl
         K/un7Vk0nCiw6xfIw3lSpX8zkLr3UUA6IlD0AscCm84vvOAg+EOImaiIJ+e+FGM8KPAB
         1yoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286165; x=1794890965;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=;
        b=H/K1GqWEchFfRBuzvmDOChbdgQgZ+8dwJmk57q8y8Xch9BVHW+pBak5ZPOCNl8aLdn
         gzCHvlR43JNKgUBqpTGcfqLVtfmmPUZOQ7Fi7FZ4wk/iwnBExIo9/8wa/XYpLMOlp/Yp
         zVmBjtTd8M0ptj3dYLCVCNMPO0SYIU+Ow6ASUJKpP1+Xt1nhD0vw35hH9C/WgueUb5qO
         UVv50JGdx3pe7gAcKbMMJ7jP7Eb+NccMfzYF1mzZsPHVlNbFIai9WSmoGPH1lOlg1w37
         a45MdGhosyym6lUlSMfLfmQHSJMEXcndoTb1dwm11CSr5xS+xYKAH5EX6aDdhLOl4YTZ
         pb6A==
X-Forwarded-Encrypted: i=1; AL+hErFQfaE7TDbv1VqdkcR2qSJquZeaf2CfZ8NPiblx3nFRMbSVmPwz0BPVeFGM88tgHuNhIrtTNNUxI3mfA8rOsTnK@lists.infradead.org
X-Gm-Message-State: APuU4Z830RsdrVQouUgvqiyjLMUggQQ+Djj/rUXoABUPOand79UG8LMW
	SLhTXFIHpHZLgZ/zvA2+XbX96+LOyFFMWIhUpX8vOy39cU4d+MZsPi4C7GFUUu6yiKH8FSbF/qh
	VETAqhUKn0cOUBltvW6ei/AthL0wW4A==
X-Gm-Gg: AYBFou24fq3AoBLwshM1jK1FmEsVkYH9cgEgtgJuvuEiBW9FrbXjY0/MzxcaL4Dtyph
	g4QyZbttSyq0PF4gLPzsjELvKSmayzLiHO6M4Th43RWY1EBRVWu9yB1i/4iu9VPfFl+iJ/C2VgH
	/cnaQ29RGn+GFnuz3tOwF2CMnUlXYgNMJgiKutQrATIxiCM4AECz1nX5pWyxwQ2SHHBQlf8uRrF
	1aCdQH/GR86/8KiOH2lBkLQFbraQWtHTN5zotdGw2tIeUrBn+tRPN/yKpja4fHQBFFtdejH1uWU
	kAbqx/8KjPw+skTbK309BNFzfiT+oTt2nUN7/DOto6FDDLlWnqivAmST3TIpOde5Y3wbzAHTrdH
	OU8QF0ej9TG3mnSlTJdK+DRkkzt1Ksasp4KXlXmE6stLuj57qjrB01Xq5P4YJSioX2cJqg9JUIL
	gs5EON28Ty/2nVDF2rREX2uf8ZTRdQCpxzBWFhHbk4zoe2TOk=
X-Received: by 2002:a17:906:240f:b0:c41:4512:560d with SMTP id
 a640c23a62f3a-c5049699729mr80819466b.16.1794286164826; Mon, 09 Nov 2026
 20:49:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <gm-top10-20261015191529-g65-295aa0ac5211@mhun512.gmail.com> <KL1PR06MB694295F7F33B8FEDA284C65DF1602@KL1PR06MB6942.apcprd06.prod.outlook.com>
In-Reply-To: <KL1PR06MB694295F7F33B8FEDA284C65DF1602@KL1PR06MB6942.apcprd06.prod.outlook.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 9 Nov 2026 23:49:13 -0500
X-Gm-Features: AclHuK9dEbOFpKZBzF18DRp2ysCfTdn-dJEdIFaJ5Bm7I0rvJVmVsW64xtISAdQ
Message-ID: <CAGEsz8F3XkYkLOzrncnLVNHSgfC3tZ_zYdVrTR4xavq+h9anhw@mail.gmail.com>
Subject: Re: [PATCH] media: aspeed: acquire IRQ after reset and clock resources
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: "eajames@linux.ibm.com" <eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"joel@jms.id.au" <joel@jms.id.au>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_204927_214582_12A83AB9 
X-CRM114-Status: UNSURE (   6.14  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jammy,

Thanks for the review. I will address your comments and send v2.

Thanks,
Myeonghun

