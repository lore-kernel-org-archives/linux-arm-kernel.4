Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819CA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qdgjHccZ;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=S3eqfBkf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WPBwBiiZBppGVA4Hfa+wR7Y2BOOxqWuwpe5sIyWKW5Q=; b=qdgjHccZXQcuw6
	9NgeI7iC7V4vuCx1vAJxdLbSfl1yJ3k1vUYx9cEbD+pnfPPhr//5IPw5BYniTUMo5UiQUMgvkpWsH
	mVnj49bNQKhfHhphgtWQf+sv1FENER5pn2TyEwltaaAhUCxoobfkPjQ41avtis8YsCEu9M0THMZlW
	T6F8AbvmP7726SY+4qtNTD1OsGcGdU0DV9vwOpop1fc3EGkHZgmoRuzldDDpOiJiB/noN3tReNnxf
	2bVieWc0hj2febl2LRfQsVDB4UmMXbEShiqvfSn48T6UZNlbcnOln/mc5n9nfXwLQ+/fp0uY4KhWw
	4LWY6WUFyCINstoqopwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2Uj-00000005qo5-3LIf;
	Wed, 11 Nov 2026 07:11:45 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2Ug-00000005qnH-39Gv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 07:11:44 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-679aeeddc6bso3610806d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:11:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794381101; cv=none;
        d=google.com; s=arc-20260327;
        b=SdTAMYTplYfa/RnN1oPwylNAnucQ9FbvDgXjS6loNrQv39qaGO3m9MsT1Ox6mADcbl
         fN4ai2QhCv+OW/hM8cvTj/+W7v37pwry1DnM0zjC9Na3BB1t6xWWHAQePd1gDW21DB24
         I9xWsPB/r/FCG6m1IRHMR3OnXuM97H7panY+iFBT0SM9VG+gJRhO9VgCENsIv8Ek+rZc
         nZZs3Ik/XvNfoOk66MLfdgaBR86caMzCZpf5GiiSrvdktCTyh8xpCjogUqb6FMoAuMEq
         6n+HcF3c41Of2Q+1CTqiByo0DWXcMiFN+BsBqYxwnBd71XsdkpeRKYG12KpKMzVLMLOR
         swpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WPBwBiiZBppGVA4Hfa+wR7Y2BOOxqWuwpe5sIyWKW5Q=;
        fh=rXlk7Oxl7teOyAOnL0cUXwvGuh0HPL6QHumEtdV+gsk=;
        b=QbVw+876fFmByb9T0oUcB3yT2PfvQT+oh7DdOytVhCfVIRNiALRLib9JAH0dzo+kl8
         EVeTmTEud7bRWZM5rbEGOUVvsV9H/yEDwagVxYfnOzItvRp6i4jE6nw7o0iGGxf7MeuM
         TRWA7Z9y4TwsCBOt5fp972fnsfVdgpGLSPsDYh/IlWiT40rxFaagj+zvHeuLqwyDmx6S
         XEELkE/nL2x0lLl7TWL7cLP+pY0RduaFW1B056myFK9A7bozelplb7CUTScQyJ4k6GLT
         PclZfmADKIgMQx3i1u/pfgh2EDTN/1VQ+NxLFP4odvZboXnCFPCMVhYCWnWFayaYo/sQ
         RX/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794381101; x=1794985901; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WPBwBiiZBppGVA4Hfa+wR7Y2BOOxqWuwpe5sIyWKW5Q=;
        b=S3eqfBkf5vC3KW8VFlB2pqFnKP8faGFdrLhnn4FqoeermYsifBP39SYIy13EAj1hD7
         e6/5vLwwX23hK2bVksuXBLeZTT2cQnCBS1VA+g/+2IppaVdoJ+L9CNslbEoYZNi67dkb
         K1DUO9e2Z8fN956h1wI0xJCk7kx3R+VEP6hSNbpYYbHqFfn8PF9+xpbQBzs23YSLYjmS
         v7yxu06qEjxydweNp7Sxck3nE4DA78XyH+LsspPqFQdoVQ6VOtOjbHV5a5qskY+d+NbO
         SvD7it4AUZxOA6p6kjdfNWIipjoW2dVmh7DEzbrpZvnf0cQ0XPy5Xf8jIgHd/wuxtEoW
         wODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381101; x=1794985901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPBwBiiZBppGVA4Hfa+wR7Y2BOOxqWuwpe5sIyWKW5Q=;
        b=aTDd4nXdaBKq+VOl2YDWWZOsPA60LWcmg36pB/WCr5E+VQo1UNzM8Hnx1trMpnBMwd
         1JnTHJciT4MPS+xe3bTz/mbjAHIjS7w64Gh/LsaYNe0c/kqMelmRraeS+Aj/xrx3HYvi
         SZuUTdt/WhvtG6BjutVMeOr425v2UNaC7ShdT+QRnV5CeHECArEuKGebln2VSufWNzMU
         CUw0wFWrd1EHD9PLhdu93Fokn73MfoqeGOdl7HaIMwwSM2FU7zKSTrg4zQY/8fqSsCzn
         KUHL4yOowsPDbz6Ufu7LffIx3rkZK/2wgERTN2c/QxkMiwSIXL+oEKug3wRIGwAlQ9di
         +fPQ==
X-Forwarded-Encrypted: i=1; AL+hErGPN+EaPtA20fC5Zl8hidZC3phgdlTvdrz5jSh6oaumuKAiEMAi4Ngkpuj5g+NUXmGV6jBCpBZcCh72Kw8PzFVd@lists.infradead.org
X-Gm-Message-State: APuU4Z+8bEcXihMsTyqIcp8Q/DX8VCB6qmvK2q5s3najV0O7x6ZFRdsq
	i/cpfIecWtAxieNK4DHejJxt0uWy5SjTrkkiN0kH3BU9OxpCVEMz0xXB/JgNAum+PmOkBr7wL2P
	ff/A7sy8Gf/oraDd/IZDLympvHn5XHsM=
X-Gm-Gg: AYBFou2bggOokaOmPI+0nY7tynL8c0jUwBYj/mxXozLJKbz0279LpTFA5g9Vs9W38Dl
	9YQ0b+KFG5uEpSpKD7mFt7iiLR1fdH7DLsNjZO1huHOQxI6Jf5OJEhKyzVK88YkDSQbaw4aPJ5R
	ko8cFnkI6V8eHqwdDjwz+AQwitrRhr3qbPnWFmt+LqRZ98YnuDim1EsmfybcNx4AYb2p5jAavR3
	KfL2EF4Qkf+QHoNQ9K4asvndkr5n2JYKILt+LCSFbiun0ZK+4tcmopA0JPNBwcU7bhqiGhti4Bd
	co1jFV6/q80Qx9PTo2ZiKjbpxj912HU7dMJiH3/zHUzHJ/40FcE/u8+6rXxuG8W97DA2kKrr4tq
	Keeao+hhCYWqrRJMWbv+THHr+6el4rUsRTLmarkD5YWWCPSM9BEnwMJBSXuUOH40/roEtGQ==
X-Received: by 2002:a05:690e:440e:b0:679:ad60:a9e with SMTP id
 956f58d0204a3-67c680f240emr733978d50.91.1794381100740; Tue, 10 Nov 2026
 23:11:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v3-2-1a8e395d923c@stu.hqu.edu.cn> <94fc2be2-01a0-4d3b-8d27-a4c42d8449d4@linaro.org>
 <TYZPR04MB7491E5F7FDBD54FEA44C3735FF762@TYZPR04MB7491.apcprd04.prod.outlook.com>
In-Reply-To: <TYZPR04MB7491E5F7FDBD54FEA44C3735FF762@TYZPR04MB7491.apcprd04.prod.outlook.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 11 Nov 2026 08:11:29 +0100
X-Gm-Features: AclHuK9fq2VWohEXOgnq_B_UqUHperL-B2npuqbYFfMCGdSky6Fm_yMTOOxsxcQ
Message-ID: <CAFBinCCwzqi13e82tVW-Je93R_1dnHvJN+ZRmqzseGJgozXrxQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: "raspberrykan@stu.hqu.edu.cn" <raspberrykan@stu.hqu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_231142_800458_27362A7C 
X-CRM114-Status: GOOD (  11.83  )
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

Hi,

On Fri, Nov 6, 2026 at 3:04=E2=80=AFPM raspberrykan@stu.hqu.edu.cn
<raspberrykan@stu.hqu.edu.cn> wrote:
>
> Hi,
> Just a gentle ping on this patch.
> I was wondering if there are any comments or suggestions.
Neil has already applied your patch, I can see both patches from this
series in [0]
They will show up in Linus' tree for v7.5-rc1


[0] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/log/?=
h=3Dv7.5/arm64-dt

