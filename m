Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F886074B3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N4XM2R32;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MjhS0lND
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=; b=N4XM2R32IdU782LFdkqdTACd4r
	MzOPZiLnwsRLp0tWkZn1G889sA4FJmQdibequ5Lh2zS32M1u4kYNDuTnXtZv2Li5ylJtumCI9wfwR
	M/l2AzLMs4uveYUA4G8udcmsOlNqJ73/xTHDJ1OiAf/x2BqTAWSjj6WzOiXiTguf7dvpMg2U/2KwS
	436xUaSDcTKW077YvrPCm1jz+PciF9BZsq2840HU4GOK9NDg6AHWlh42GiJuf1Z6N3mqN4q1YqGIE
	5qxpB9E/j6XbVPXmM3/yWYo4MDJCe/gyJYnLLkc7lhmoHnOCcbqeVTUbZ1gEFtOoBGEVq+2GCVH2d
	ZrvaKs1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRv7t-0000000DkYr-2Bfv;
	Fri, 13 Nov 2026 17:31:49 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRv7n-0000000DkXZ-336H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:31:45 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-6798af41644so916512d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 09:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794591102; cv=none;
        d=google.com; s=arc-20260327;
        b=FSdRYABVKsBSFDNdPXkAeRfKcMs1nCcbkLTsccB4RMF5LVzJkZJteGgaIbrG4qujrN
         jfozevS+0mzBgvm0DEWISt1Q3hHxmbtHzk/iol2/G8XQhUkBvtmN9Qjxn21ltNAQnCuf
         K+i638OrW7MEtiE41Q13VX94Q5p0B6poAmgPkL+3HdP5NnXwLLSGQM+mM0sKwYKITpUE
         yNG8lHxFkUUAlF24gMQtdx4K5Olqssnus8fq/n1UANjksKQWjutgkBSBjIluaFrglLid
         XEw4EUPA+DXiuX1xXHbYRiZNefj0gFcwwTnS8wWyETmpwciDGpqCBcMP2ObTgAaAqRuZ
         +8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        fh=BeoP65HOTLTpMcqYUlZY4iBvPAOA/QxTwvkd100Wmf8=;
        b=MDtfm3aPaj6f4gxtudwHJG+4KvgxiHD7bOuBAugSUYOr5MSs+0mS7FFFEEu2ejmaWI
         kHV0eMbzryU3//5vJ/eOTF9Li7qUl/m7hbBdfEeSlvjKeqCrXVKYil0+m+kpv3t98jCJ
         Gmi8l+znssn9r5RLMNzjfTRA0qKOU5pT8G+QGLHE4gpWksjl0ShepjIR2uVepf/B6GnZ
         7brZnY3bdMCr1YMfjOIZE17y8Mo5nd/g0sfOkKSwVhTdKWB4fcuEju1rEfsbmOOp4l/I
         C6ndsV8cWvoqx7KtaphB//XhgTj6jbR/E4/DxxTkxy/fc+Odl1rt0wB/pyvjGVMeP6QI
         RTgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794591102; x=1795195902; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        b=MjhS0lNDiHuhAVUNoeA2W5ShUt0KLYWb/WHUSdRcQdDTDvOwdnBF4uvivlLDI0k+G4
         RuDlgoDp6+si0fbZQb+QpcFRnjbo8uXJjlJ/kyS1wqpSyiLbJSCQ/qmig16BeLmO7UGT
         ydf74V1V8awDnaNX93c+CxDPhhrpwsVY6uK3mztW/ulk/op3vAUepGUaL+7Xn5MBXCC4
         kpYufUV+UT/u5JTg0btXiWqIGLRull9WrTAPz08ui6EuxEaNDmUsuX61U2cYQ6xm8Q8V
         rFqgZo042d0MyUqgt5VlA/bSlgS4iHj/pr7+nVLSqbYh3qh+bYMKdTwCA4N5lXTwtcf4
         oYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591102; x=1795195902;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        b=tUEpjp2g9NCMQLGv20rhZVbAkUXfuypt2iitCLC2I/vc2I64aSheReRthyVlS1Qxtz
         yXd5ZMM3fIL8Q2etcpCeh1ZJOlZE4ZRaelovqVuQzS4/kjUAYisPi+nKTayeGAKbRVUG
         cXzz8pgjPC9fSQFAPV+1Cy6JCRldCneQfxy6tA/KnlKb/pNmv5vKltAl50RgD6WBJmGR
         SBE7Q+mvjiatC3n0J5zWWCHa8TTC3qiD2dU71vna5qyAvBpjAI34U/LBfCp7XqU3wDGA
         89nYeWvDZEE6xK6OKGxpahEnwKYFOtvBNAkKO1C7zACVtLqlUeLjHpOqR/BPdGixYPBV
         f6+A==
X-Forwarded-Encrypted: i=1; AL+hErFOU2oyBGRvT0cD72E5E8VwOLm9ttNOihgkUN06kDirOo6no3RUabAJ3HjGJa1KnHSIRsU6m0kOB0PE9amyLige@lists.infradead.org
X-Gm-Message-State: APuU4Z9p2Np/fJg8Ju1DAEPwmfln3nI0ZXqrO8mXo+Si850m9Um7U4+D
	SAhITISeVilqJeyonpegXEmjWc5qzktS7TBRfNUw21HrGTh30rO0HqvbEDXCicI4HcL3RBI1AOm
	X3EUhYxpMI25e1WI4PHTL6sChQI6F9T8=
X-Gm-Gg: AYBFou2dY86XopFZcRlcZzvf/Yk6umHSG3PIstqEy0ePIe6zIafPh/wV0lKSi58+UhC
	MWMKEZsmFyfYzGI/B2+3JfryhTG3gjpWUkmoT+RXhGA2yxN+pI0wMCOUTeeYjQe3tQVd0uUY2EK
	4KW+7SiJLs74n88Dj57/7MzLp4gCG60HytxkNkK6fKyIGLt48ZjwcjlqozhddgcpqcTQc2HpPdm
	4ACh6zDFX4zP31pMmQYj5O5Cgsdq+NEq8GAuVOlbOrYANzHf2biqkhK/g0kJ5CyF5UmEY3Rn2bB
	+Ew1E+L5EfaS5RKebvT0B9Ibj9ungnAaA3MtORHWfDOpHaouStjgqVfVISTJEMHsr/hBtVkM+PN
	u3Jnz+zUZr6sSpfYfH37TDgwZ9iIe/S154xlWtfCJ7s9klClp/Is66l2fgbmvS/CCQi7x
X-Received: by 2002:a05:690e:4510:20b0:675:47ba:2183 with SMTP id
 956f58d0204a3-67d89709f2dmr1486987d50.53.1794591102378; Fri, 13 Nov 2026
 09:31:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113003217.197757-1-ansuelsmth@gmail.com> <20261113003217.197757-11-ansuelsmth@gmail.com>
 <737e3c57-9aad-4081-ac75-f79cb2084349@kernel.org>
In-Reply-To: <737e3c57-9aad-4081-ac75-f79cb2084349@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 13 Nov 2026 18:31:31 +0100
X-Gm-Features: AclHuK_T9pn_LFNwcoFkFSy1mvqcLyRF0a8TMF1gVMEOv5saT-u9fzFGXIXxZrg
Message-ID: <CA+_ehUxzPo--g+Ksd_0xJZo7_bhYZ-B17wG3OyGtU=3aa6B+WA@mail.gmail.com>
Subject: Re: [PATCH net-next v19 10/15] net: Document PCS subsystem
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_093143_797901_618B9F1C 
X-CRM114-Status: GOOD (  14.14  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Il giorno ven 13 nov 2026 alle ore 11:52 Matthieu Baerts
<matttbe@kernel.org> ha scritto:
>
> Hi Christian,
>
> Thank you for the patch.
>
> On 13/11/2026 01:32, Christian Marangi wrote:
> > Add extensive documentation of the new PCS subsystem and the fwnode
> > implementation with producer/consumer API.
> >
> > Also update the sfp-phylink migration guide.
>
> FYI, the Netdev CI seems to have issues with this patch when building
> the documentation, because a new warning is visible:
>
>
> /srv/nipa-builds-contest/testing/wt-doc-build/Documentation/networking/pcs.rst:3:
> WARNING: Duplicate C declaration, also defined at networking/kapi:486.
>
> When executing:
>
>   https://github.com/linux-netdev/nipa/blob/main/contest/tests/build-doc.sh
>
> Logs:
>
>   https://netdev-ctrl.bots.linux.dev/build/doc-build/results/909345/
>

Hi Matt,

thanks for checking this... Yep I manage to reproduce and I fixed it.

Will be present in v20.

