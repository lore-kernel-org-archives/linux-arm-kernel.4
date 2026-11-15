Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC4E606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 16:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VHjMsOOd;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jgISo0lo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eAXXrvsjRFMO0n68EN7RdSjVlW+SNmR/BRQ8PtICMfY=; b=VHjMsOOdSc2wWO
	KzHJz2reYOwuv09vgZss7YdEF5u+iQgcKpL/hW6uJ1haBRgNCeIv4l171fiwJOzhgbLADvIERd/7F
	ZxXKVuWadWKPQG4GOJfO/6dSvYNMX/thfxMkNF2YwKaqlaZurAuzOYwGW0F8uz9UQlR9qIjXqKed/
	lcd0TKMLSroUNLsE/J4+oWSxOh4eI7AgKiW8A5xHRZVhAGHOCvKdMg+Ao0IJ3X789egP9q2bpfYq9
	s4SLhUtW56RObSCpgkuyVW+lhQzzi8K+SuqsIVp1Qb/d3PEu8RtB6NML+EvdJ/kr5R4fzcrFq/IN4
	oY9+iFQOV19ppzEc6m6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdKT-00000000D5x-0Mqq;
	Sun, 15 Nov 2026 16:43:45 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdKQ-00000000D5b-1e6B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 16:43:44 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-54492d8a988so184421cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 08:43:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794761020; cv=none;
        d=google.com; s=arc-20260327;
        b=eu6luvqc0TBlx4NZH54ELIcQdGJySMI+BmphxZIEhVBkfD60SXgyIgIpH5CnYTIDoR
         QYxffN/R89QTJOdj6n0J3tZXdkUZ0SC0fm/ZAP98vTuVF32KegS+f/hPX+kqzMfyeAMB
         zcL4QvTum2Twl6bnBY/iorDo+uOBYlBMxlcc+21EwkzkExhiRom57AI8PEnMCqHt/are
         BaynnL9iPxmVdCFlkfX4cKkZv5B1fOTewo8oAnjUOGELLYM1guJsJhOsNv/yHYjYnSC4
         F4lN8TVuTr82YAOXfFpD20e3rnVKzNOu2Qp+csxal6VZSzIHkL2wVCF5ZselV31++aod
         w2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eAXXrvsjRFMO0n68EN7RdSjVlW+SNmR/BRQ8PtICMfY=;
        fh=BZltaAJrTDtort2zrV5fR7Pt2h/EkThjGKnt5tTCd/w=;
        b=RzSmBUY1anFLphLB6/UeselvPfnyq4R+mb+CptwL/zk56tg1mKY/LzvCt/d3n9dQ/e
         R/K4JXOm/bfe0Z1sID8dyYM6E7/TZ34zZxyfGWTyVbyzAyfoPKrzFURfpAvP8dSERBeJ
         //2zgeuzRbKlzianRLdgqsE5yRUrpZGj8ookHa7ul72Gy687TQKI4je/tO9v8AXnG9gq
         WUCP7BAJk84r5Lf7YOYBdJtj1Egy4YZy0on0SgGWdTn1uPT5/rDP8H5SB/1tJXx2msi+
         IzwvWpqe1ss/94251lByaC7U1GAcLxXxo+de6E48l7yIClXk4Ys74/DRHiR0QRgwP9iq
         aibg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794761020; x=1795365820; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAXXrvsjRFMO0n68EN7RdSjVlW+SNmR/BRQ8PtICMfY=;
        b=jgISo0loGG59O8UiVJWDWrrST5mW1P/Gq4APox2LNhTjgLLv8d/C08xgYouyJkrKrD
         7ARLSUAHdHTUzHrAjJQjFEugrn0VuYtIjtz6toA7fd0cMaiDd0xG3RzdX5571GtWKxZl
         bRUzSe3l0HRdbxrOcOexhlwLOq+SfEC+2vPj14p4l7pfeSnf78mWY0G8yplBM6ymr+Hb
         44TJWY8453m20de9SrdD6xHtiJ7UcUeg3z9L2CQ3aItnhPvpZx8QDukU3JI0nBNCW+gI
         V2bKIN3uPGB2VoVuEbt2JGRKFdnvJUO1Hot/GkcUlZHve+6CHGvbC4nwOFcMCxCm+f77
         V7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794761020; x=1795365820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAXXrvsjRFMO0n68EN7RdSjVlW+SNmR/BRQ8PtICMfY=;
        b=y4yZcK6+rBfLsOOJ3wTSfLvvkBXulcnw8iMK0cUdiboRbWbZ6w3QSwgs1BivPigDnZ
         Grs6FPG8dlz/5RcQJDxjVD/U+Z0vTFffRjNk/SwhWF+wdQGUXF7TWG58Q7JygColilna
         y2ID5/TzwMlKTjEwmRuq8N9GTvqGa/zMmbOB9Eja3EK9RmNMrlEwZDCecKs7UycTQStP
         pq89dD20XqEH8qXGg4lnG8VIBbsswlRvK3J5uUcPW878XhXXTBE4XptQiNxYKei3e6tM
         FBRmwFVxPS5XeS12i3rfPBxAiEHdU7gpX4pfmCviCXUDly8S9jk8hIkNVjOtne+habLo
         MhRA==
X-Forwarded-Encrypted: i=1; AL+hErFwibMVH3pfqp+D1p/TSIyYYO8hbJUxyadn5nJ8SJLiWi5e5dq9yDzl/PwLWHjmm3VwkfhGdUpyggaNjhhGdSQH@lists.infradead.org
X-Gm-Message-State: APuU4Z+ulYuhg4uC75GDwIEmBXWpbqZB802SqpCGzh/dJoTBa2xUqUP0
	0v9Vl4SURInzYVHtDyi6KULWkgHfMMOKRv9Onx5/YCzL0/FAQyv9fmgbt+6NLttsvbMO7uoHtHM
	4xK4Wj3hJ0voDHSjIJJliJ3W+p7O2y06cJH6oE6ll
X-Gm-Gg: AYBFou3MSl2ivFxE2/duhv156Qvh4xF3dMpcWlv2fymFIoAexHF+SLzaIZx7jJ/hnfW
	hy0SIAlRSdLEeexmdb9BsyAhpSAmlh/ehl3NuyeqR40pFk7Pbo8aDSGbCr2GT03KaF9CgGrO2nD
	gpUo+8WuqFlzYJVFcbq8+CQlvVMAxqj8uhdeUsgXy3JqOYudGfqUklYaUAjJDNNdEvBmgmssC1r
	4Zw62z/mfapG3sa1BMpEQ57e4TNgri75qMXc7p1t1pwea2HAlL+AVkfr1UR7KdENdLLqUSxmQ8O
	q5GGkn7QgsLs9QgeK29xJA9B/zvP4k1+Nw6AMOWDFEnUaXt5R/O/NYGnX94q6TtIj3ArCT1Azs2
	Y0eZZ4v22lmpW56UfFMt8VZrJASHWFkcnRQY4aXStJ+nH3wvkd6e+5o0/5BMNtJWqLeEQZyjMfO
	zpWqqVEUayM1TlPv3fQ5XnkcNf
X-Received: by 2002:a05:622a:230f:b0:55b:ab4a:6fad with SMTP id
 d75a77b69052e-55c67104981mr23175511cf.9.1794761019198; Sun, 15 Nov 2026
 08:43:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-3-vamshigajjela@google.com> <20261103-handiwork-replace-25efd6b3d8be@spud>
In-Reply-To: <20261103-handiwork-replace-25efd6b3d8be@spud>
From: VAMSHI GAJJELA <vamshigajjela@google.com>
Date: Sun, 15 Nov 2026 22:13:27 +0530
X-Gm-Features: AclHuK8MvtFT0aS_Uz-6An9GgpSrSIomZQrTNYNRlPO6FZypoZaZtmFLqNrb5IA
Message-ID: <CAMTSyjrYSzb57w9G6a+JVaZzRHBBV6zaW_Br_UcM7C5REWLgVw@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: spmi: Add SmartDV SPMI controller
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_084342_473602_08896A58 
X-CRM114-Status: GOOD (  32.13  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 11:47=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Nov 03, 2026 at 09:56:06AM +0530, vamshi gajjela wrote:
> > From: Vamshi Gajjela <vamshigajjela@google.com>
> >
> > Document the device tree bindings for the SmartDV IP Solutions MIPI SPM=
I
> > master controller ("smartdv,spmi").
> >
> > This controller IP is integrated in Google Tensor SoCs starting with th=
e
> > G5 generation (codename: laguna, canonically written as "lga"), so add
> > "google,lga-spmi" with a fallback to "smartdv,spmi".
> >
> > Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
> > ---
> >  .../bindings/spmi/smartdv,spmi.yaml           | 126 ++++++++++++++++++
> >  MAINTAINERS                                   |   6 +
> >  2 files changed, 132 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/spmi/smartdv,spmi=
.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml b=
/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> > new file mode 100644
> > index 000000000000..e0512e60d932
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> > @@ -0,0 +1,126 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/spmi/smartdv,spmi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SmartDV IP Solutions SPMI Controller
> > +
> > +maintainers:
> > +  - Vamshi Gajjela <vamshigajjela@google.com>
> > +
> > +description:
> > +  SmartDV IP Solutions MIPI System Power Management Interface (SPMI) m=
aster
> > +  controller supporting MIPI SPMI Specification versions 1.0 and 2.0.
> > +
> > +allOf:
> > +  - $ref: spmi.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: google,lga-spmi
>
> > +          - const: smartdv,spmi
> > +      - const: smartdv,spmi
>
> I hate compatibles for purchasable IP like this, particularly when
> unversioned as they maybe become effectively useless when a new revision
> releases. The standalone smartdv,spmi compatible has to go at least,
> soc-specific compatibles are mandatory.

Agreed. In v2 I will drop "smartdv,spmi" (both standalone and as a
fallback) and use only the SoC-specific "google,lga-spmi" compatible,
renaming the binding to google,lga-spmi.yaml and dropping patch 1/3.

>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description:
> > +      Core clock to the controller from which SPMI SCL is derived. Opt=
ional if
> > +      the controller uses a free-running clock and clock-frequency is =
specified.
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  clock-frequency:
> > +    description:
> > +      Input core clock frequency in Hz when the controller uses a free=
-running
> > +      clock not described in clocks.
> > +
> > +  smartdv,master-arb-enable:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    default: 0
> > +    description:
> > +      Enable master bus arbitration phase (0 =3D disable, 1 =3D enable=
).
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?

These parameters do not vary between boards on LGA (this applies
to all smartdv,* properties below). In v2 I will drop all
of them from the binding and move the LGA controller configuration into
of_device_id match data in the driver keyed off "google,lga-spmi"

>
> > +
> > +  smartdv,master-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 3
> > +    default: 0
> > +    description:
> > +      Master ID for the controller on the SPMI bus.
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +  smartdv,spmi-version:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    default: 0
> > +    description:
> > +      MIPI SPMI specification version used for transfers (0 for MIPI S=
PMI v1.0,
> > +      1 for MIPI SPMI v2.0).
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +  smartdv,arb-retry-limit:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> > +    default: 32
> > +    description:
> > +      Maximum number of times the master retries a command when losing=
 bus
> > +      arbitration.
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +  smartdv,prescaler:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> > +    default: 0
> > +    description:
> > +      Clock divider value to generate SPMI SCL from the input core clo=
ck. Writing
> > +      1 divides the system clock by 2; more generally, a non-zero valu=
e n
> > +      divides the system clock by 2 * n.
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +  smartdv,read-latency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> > +    default: 32
> > +    description:
> > +      Number of SPMI SCL clock cycles to pause during bus turnaround o=
n read
> > +      commands to allow the target device to fetch data.
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +  smartdv,arb-scl-delay:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 3
> > +    default: 0
> > +    description:
> > +      Delay between arbitration and Sequence Start Condition (SSC) whe=
n the
> > +      controller is the Bus Owner Master (BOM).
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
>
> I find it hard to believe that this is the set of required properties.

Agreed. In v2 I will make clocks and resets required alongside compatible
and reg, and drop the remaining optional properties.

Thanks,
Vamshi Gajjela

