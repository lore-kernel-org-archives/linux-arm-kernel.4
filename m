Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E2F606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 06:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I3hKPjBM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J4F1do7Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=; b=I3hKPjBMSxcwkm
	DZWVu2OmQsA8XEIQfU5Ixuc70HHfYuqxY96cOw8r41zipnR9DkkLfJhZ119KKaGfPPh5H67dJKhNo
	ES+NyTBx3H9LY51giAZSztuvhtH7uHYN7AcNbcQLLnnnd6x+ySX3cCN6+RVRd5VPZ9DHe3ykzd1ZV
	MVTrZVs1ha6MbaBErSMYb+w6rxX/08BvScVfPPLAfRNoqfiJQ9OmfNB9pO3iaOkmOSz0Yq/92Zn44
	l/Vd2yJ6NsPDeH9XftToEZAqW8cHeXKUomg0IiCN+qKpz+kWBn3AReaJsipQsIQTx7K3SGbJolXcJ
	gKdGLlNbQ7K2msDTnAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCHi-00000004dTh-1nQb;
	Tue, 17 Nov 2026 06:03:14 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCHe-00000004dTK-3wCt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 06:03:12 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-380c28f9e35so599335eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 22:03:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794895389; cv=none;
        d=google.com; s=arc-20260327;
        b=F66scrhWuuWVlO2EoewHOcQosXC6FiTGbT5uZ8LncTZDHO4DxiLMYbvrpeSSk44rTs
         IbPlgJZBfC7TII+wj6mAg4L6rkePUIe/T9uViPCvV0udjmIB4jPVvtmv+xNwuH3t/FZr
         0xhATnGsJDYdCc+IXZ7ja9nrq+iYgQLVc5fxNpe3WqYgF1AsvaWL2z6caG4gHYv6Qps2
         /DKIJQsz/mGEQ+kfrffB7WuZotL5IMB9PVH7KSVjforrPL8OSIt9L8icYxAuQlAMyXX7
         EksivS2Ap7gPZd1kun50PSTZKGRgu+M0RMAZ+aHoalXLL6BqFAv69imdNeIZKgdS2f0J
         FZzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=;
        fh=431J9gjqveYaLn8gjQsrRHemHEe7/wIQBcL8N+pKYFA=;
        b=bAi7msBn/xEWhU//PXTdqgWngBaVyU7RXfTvWLMw6lYh1+KyKVgZQA4dlsv07rIhPa
         CHzSmtn/vpobgAjZvASSdbLP3/hTNKgLHqiu6XaNutOLVgsDm27bsghXi3g9PApIhVsz
         PS9Za3gSgLth9a+5wHAMJ1vcv9Fk8mBrya8cQ7y/7mpUnfhV2UEY1DSNSoxw4Zo1jRTL
         Ck1PbXipzVtP+6NCYFfrPfetukIFj49LZroj/HKLbpMviZUSCd31lvrcdhGesRLd5uOY
         Bvp6GEM0SWc+TsSFGWZkbYLM+eNuOp/AAK1yddxqZ6K+STFkbj7ez6vwzo93t5egLRv2
         7ZGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895389; x=1795500189; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=;
        b=J4F1do7YaMO4/2lSHYdM9SiaKfwFn+s8h6n+sLHO2et+zZaPkv1m8+DioeEu4liMwt
         HpzEfdRSVUmDO0iJTm4TLlbMKYvyxi0opSqPrmkoeaNoJlllLnnSk88hOEULXk/7qf+0
         5Bnc4Yw6izonVeJ0MMNidERIeTFeJxkyBnZaf+AjeMzW2FngkSTYqwOShogAKLnwhJUM
         Q4M9B5WV0yDTpoqOs8oYas8Lix7fJTELs98rFN50XoCY2dJGqyFwRWMlQGKpAw6kfXFQ
         7xTY3u/zXndJalTEl0HhfV4sZ4jqydfbmCRf32cOmgKvGmdS53Kd8Au2Xjs24dOHzm1l
         L/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895389; x=1795500189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=;
        b=Zy8yBkuW4NFdtdZA6sT8cq3fUaAJatCJxVPwIbG7rhFOig+klaqKfjxv1tpuMFG5Kq
         DuzYxxyC5vxTCeQTuO0N8nkrvW5oc0oVctI3VU4PVodsSb5tWO4AeVl427TIBtxr1Jmi
         8FiWrgY4pgyTM5e/XNc489vYd9kV93/92Sa0/1d7wt8eJzrDP0M8XbkUt3eoSpJEMa91
         BOQm/OEuPfkkMI+Temx1ShC6UA180NtBh0kEjHkBmWbN7RBclWPCux6ilrG2x0tshaMt
         O5q7dsZg1G//0xpJKhT11ejp12K4tYqBurk9Nr52hInd0151wqs4GVQgjLWc00yhJ/pY
         r13A==
X-Forwarded-Encrypted: i=1; AL+hErGDnU3z7R32kBoJ4qQn0pTJb8nWqBHRNAgmIiO7W9dWmS2JaEMfuWWJ/fg2Ns3B8/SDRkb7YSLJjKN9IcU2YWwg@lists.infradead.org
X-Gm-Message-State: APuU4Z9py5ipNEniA1IkCwf5K5LyW1rGEc/icGFoWnkbMbyyAiiBtU1s
	cRsKXEppjiTG9YaW4Hf43UKK0V3Jj8TB3cSunhp2nFIjXu5qp7WVfSAMUy+dEfc2GC7NquwEqcE
	CRB1iAT3rPpdHz236vrCR0tcr/3iwrVI=
X-Gm-Gg: AYBFou3NhQdaRkb+BnVSSJ8aMR8lvtn2HfzNw9B2xC+FhWBmt8V5aLk87NLyu3m6FVY
	xKT16butHnIZZyXjLtD8WgyfwS6ADnJ4YeagQGYMldfHCgq16++JZgSuA2cZDFSG6Sbl4CJMpX6
	x9mjhEfMn0LwcQUvLBghM/rSIO6p1FDQ1JN+UP6QLNhFNvQdY5Rxj6x9X4JQkEuZFn4UpkzhzNJ
	MkqYBG5QARf+Nd59McJ+wQpkNr9jA4nUSRC7y+1KVcNbOYS0DQGEiVapYeJpGjviuppQhJI+VKk
	CZHeM0HT882PeVVbni/jQ/2t4TSKwFB6uCTT63YeltBNRn0wNsJwt29TsDDAWSm5VXX0USAfAdR
	RM6fEDmjrSUadPCTdxut4DYuvRQxWlqj4WHorQ4c=
X-Received: by 2002:a05:701b:4586:20b0:1ab:cbd0:1c96 with SMTP id
 a92af1059eb24-1b53a429876mr1337313c88.4.1794895388323; Mon, 16 Nov 2026
 22:03:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com> <CAPx+jO-qPAuOGnGfCyGnSYym8PBOaqUJptZh8duYJKZN4HARaw@mail.gmail.com>
In-Reply-To: <CAPx+jO-qPAuOGnGfCyGnSYym8PBOaqUJptZh8duYJKZN4HARaw@mail.gmail.com>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Tue, 17 Nov 2026 13:02:52 +0700
X-Gm-Features: AclHuK9yy_ki_wzibjw_yQRrzFByvuyKJxJWKjlXJNrv02S4I5fFrI_oRWpsa90
Message-ID: <CAAq9HC6kCspxX8DyDXp2RuhFSXmU=1p0s6xdOmjhGZ9gZgmj=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] cpuidle: psci: Allow skipping the suspend mode switch
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_220310_985679_A6092DE3 
X-CRM114-Status: GOOD (  24.50  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 8:14=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.c=
om> wrote:
> >
> > From: Alejandro Tafalla <atafalla@dnyon.com>
> >
> > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI reports that OSI
> > mode is supported but rejects any PSCI_SET_SUSPEND_MODE call with
> > NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and the
> > probe is aborted:
> >
> >   psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain faile=
d
> >   with error -95
> >
> > Add support for the "skip-suspend-mode-switch" property. When present,
> > do not call psci_set_osi_mode() and continue with the topology that was
> > already built.
> >
> > Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> > [Reza Kurniawan: split out the patch, added log message for skip case, =
renamed
> >  the property, added property check at PSCI initialization]
> > Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > ---
> >  drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
> >  drivers/firmware/psci/psci.c          |  6 ++++--
> >  2 files changed, 14 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cp=
uidle-psci-domain.c
> > index 5722365b94..cc9f14769b 100644
> > --- a/drivers/cpuidle/cpuidle-psci-domain.c
> > +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> > @@ -159,13 +159,17 @@ static int psci_cpuidle_domain_probe(struct platf=
orm_device *pdev)
> >         if (ret)
> >                 goto remove_pd;
> >
> > -       /* let's try to enable OSI. */
> > -       ret =3D psci_set_osi_mode(use_osi);
> > -       if (ret)
> > -               goto remove_pd;
> > +       if (of_property_read_bool(np, "skip-suspend-mode-switch")) {
>
> Rather than reading this property here and in the psci fw driver, I
> suggest we just do this in the fw driver.
>
> In other words, let's make psci_set_osi_mode() to succeed when
> "skip-suspend-mode-switch" is set.

Right, that makes a lot more sense. Thank you.

Best regards,
Reza

