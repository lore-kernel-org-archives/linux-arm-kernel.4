Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618C7606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 17:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U42jI1mh;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X44t/umW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=05mNmZaatL0CORPzQTX8nQUpPIvU0TyMgu0JPcvJLqo=; b=U42jI1mhoClsdd
	dTfmDXlsJznNdaN7yQi2pHxwzUoD3/WlYL6ZLcqPMcK2RloRBAdDpBug1UcXGnZzLM5XgColsVWIM
	DIWbGWE+JbJB6weOVCJcxhI/q1DR6WlrkokydLRW2YF6390cZwKYRs/IoxvFzRWEIMjgpuTdfmmfo
	4wTxjz9Z6AKP+7Nu6EhGb/zGB6N6bFYmLY4NMkINe36foJrAp4uEhfvILI6KDuER76jowgpA1jU42
	CtvYAwXb7q48PmOGp+xe/wgllQABHpMgWptEDyA/0zrJTLY7AOvnQCGHTBx96jnNC4tMtGfCQKc5Q
	PXLwVpYXCqM+9fC1V8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdo8-00000000FGt-0cWg;
	Sun, 15 Nov 2026 17:14:24 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdo5-00000000FGW-2VIv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 17:14:23 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-55be673e029so197491cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 09:14:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794762860; cv=none;
        d=google.com; s=arc-20260327;
        b=BwI2iSBM/sIndGcuspd1S7EeDZLP7sauWIvug5l0RJI5mc6BBe2t4aGP0LLYvAYlN4
         QrUiXfJ9PBM1mqNCJuzQyxWv7ZHzpvBWndrcFjoY7khN7hfBLaIGn7z+Lied1Lz1IMCO
         IpIvqAuLakx7k63FKkorUbvlqqkWH5+7hJNd78L++FEnjfZbbtEmup+HfDtFlnLa97K6
         E5sD99hihuwhxxRaFgIPHueAS8FAVZ9WvUifZMlgLm9BKVQbvPnLTAxfiAOUAgbGV5Mx
         vPlEAeoak0Gg7KGSJXP/vC8zhoeIBVt6j6ALTR2VuFrHRmfGxjC0abHQqhbL+d8uGb/v
         Lz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=05mNmZaatL0CORPzQTX8nQUpPIvU0TyMgu0JPcvJLqo=;
        fh=wgGXVTRHcxqsU5I4iJmPTyHEEw2Bny+t6vo2IKjAQKQ=;
        b=I68BXgo88WPhXWsTzqdCecaoimQIdzuqG0hrfFClC3OuYdQF1RAEw0Fd2Z2TTLFVzt
         CXwYTUtw6y4ELqqvVrQ6etNpkhgZhnHfLyYZqRDGuUcQtsJjCs0fLrCU5CwHzqVo13nk
         ORF41yv9y37t0XE0OAczYue1MCqju+K5uchAaHrqklpLhPo/BI6TFccmx7xvmUdqjn8a
         H66CuJn6wZblm1rB84UsuWbG90JYyvkM2LnEOeKKGJUGMfrxMg36M2Z5maSTqK+8Kv06
         X895tuyINGFGiPg2tZczORml9QAvZaWbcZ1kDxRP2QOOfoA85hE7wr5eTCIziw7Ub3+l
         Tz+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794762860; x=1795367660; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=05mNmZaatL0CORPzQTX8nQUpPIvU0TyMgu0JPcvJLqo=;
        b=X44t/umW4CEXoMRezz+S3f/LmUAp5UJgcAY6IxdDjKzAp3PyfUcKNMPFchbnbxIVKO
         SJ9GmjC3beFCbXinKU51nYtFFKGv3WTe4z7AFrumNNFUEkESBbqYi+I9Vzffa+V1nYCI
         diZEUGFEuKcCqOppuIzr/pntrXeXQeJ3zeJG1Kz+589AIzGdqlYgrWBHPdjbific/Klf
         lkVtAdSDlK3CHPnnHZ7OW8pTXp+q78CJ46tKRfcNeu+JT04ZoXRCFa+LC97H924KBnu+
         YH7i9oQFmrNjL7bGmi/uyE3HNS4fjrN3V+gRkaqxMKuPRge5Zj6gSRmuhAgcZ+fHbOKG
         tZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762860; x=1795367660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05mNmZaatL0CORPzQTX8nQUpPIvU0TyMgu0JPcvJLqo=;
        b=MjtqEi7nMGWBNMAGLwseR96Gy//fexlKG7zMtgWdH54EMkakK8gwM+O4sdhzY4N0Qc
         dxxwQfgezXdtwvO1OgLz5xLC65Gte2aGcJQlcRDHZUi2KWW60hDXK7S8+XnaHG0BUcY7
         vw6WflQFmyJ2MmzNqpA7HX3j+/ZAM8EpNv+wafO5YrfGrQTwwMG8oW3Hfr5gBTO1ovPk
         e+k2o05mAQNHeLWP5jiQEEhlO24N32yxqc1WYI9k8u3f8QCMwcOsvyMfrLX9E5rXjAuO
         JgjxYY6UZdH5R/X5ZJ6Hi47ulEHJNjsStLFFxyLh6YcDQoakPzmgGzkWhUtEK2IKbcGf
         cPBA==
X-Forwarded-Encrypted: i=1; AL+hErFgH+kAGyrMmJsT0vxPQ1jBAOwcIAsBDXg1i5dt2Hl5qaYe/KpcP+Od2cIJuAW2LJOQREgacy+jIOOQtk0iqopW@lists.infradead.org
X-Gm-Message-State: APuU4Z8/3WP9lUXEyvBD/3WwqEFIQyrURrdISaI2y5FD46aJPr7XK7Ju
	1P5febfw7JMI8rEYHpQkofNPYhYym6fei5FOrYy8Rfkz3+GXWLKNgBQQ4Z60AuYMU/3AwFK0I/N
	iTy7nX93T6lGA8ZTsE6et93o5Nog1yAN27+vx+EFH
X-Gm-Gg: AYBFou15HvmzoUWqaKq2o8+NEPfdz8Ut9l2ox/aBVjQqUQR12WBHstGvEDNa9kC6jHY
	cgnx9om5DbKHVXK4v8MadcZfZtII1fwVnZJkIp7S/JOfAcot2M61uN9WjHKAwJyhQFW00j/ApeY
	gpHxVDT4B1aU581VKOKD6dHRin+L9umtA0HFLa7kQwxflb4j9k6O/lGLTR1LaHbiannldc3MhG+
	FRhtXaS1dJ1l0YR1w5KbMltPzlMAEkdqqZJrr6IV/3y6krhb4DjiZoLRhdwozP1AGIQeJy8iAi3
	20fDBYjnMP9B12yyFCNP7K076Q9a8Lwc5OP19LgGZr8A6P4K8oJnarCeUxw3aF4Q2F1pIEgyuOw
	y/0ykXbUx9TMEwGYAHttYEI/S9zfp87eLVXR8zQnEvV32vPun2LHS09LGaXKQgihRH5ZHFIdd31
	DeKTJkLRDhjleJBQR7YKapN0tfOSWfBJ1pFaG32MBrjLnmnA==
X-Received: by 2002:a05:622a:53ca:b0:536:78de:775f with SMTP id
 d75a77b69052e-55c69c2ff17mr23222831cf.15.1794762859662; Sun, 15 Nov 2026
 09:14:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-3-vamshigajjela@google.com> <20261104-colossal-illustrious-guppy-87efca@quoll>
In-Reply-To: <20261104-colossal-illustrious-guppy-87efca@quoll>
From: VAMSHI GAJJELA <vamshigajjela@google.com>
Date: Sun, 15 Nov 2026 22:44:08 +0530
X-Gm-Features: AclHuK-yTkRrUncnurNuyi5Wl2ro-fglUcoEeHi8NCW7Il2Q9Y6sBXYKy5bfL-s
Message-ID: <CAMTSyjoBw6uL3yT2rEr8LUsoO-F22v7nSKiD6sOLhDwVsi=fvg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: spmi: Add SmartDV SPMI controller
To: Krzysztof Kozlowski <krzk@kernel.org>
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
X-CRM114-CacheID: sfid-20261115_091421_681798_CF53D1AA 
X-CRM114-Status: GOOD (  31.58  )
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

On Wed, Nov 4, 2026 at 7:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
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
> > +          - const: smartdv,spmi
> > +      - const: smartdv,spmi
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
>
> Don't repeat constraints in free form text. Just create proper
> constraints.
>
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
>
> Why clock would not be described in clocks? From where does it come?

Agreed. Even a free-running clock should be described through a clock
provider (e.g. fixed-clock) and referenced via clocks. On LGA the
controller has a clock and reset line, so in v2 I will drop
clock-frequency, keep only clocks and resets, and mark both as required
(removing the redundant prose from clocks).

>
> > +
> > +  smartdv,master-arb-enable:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    default: 0
> > +    description:
> > +      Enable master bus arbitration phase (0 =3D disable, 1 =3D enable=
).
> > +
> > +  smartdv,master-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 3
> > +    default: 0
> > +    description:
> > +      Master ID for the controller on the SPMI bus.
>
> smartdv,bus-id, I guess

In MIPI SPMI this is the controller's arbitration ID (MID, 0..3) rather
than a bus index, used only in multi-master configurations. Since LGA
runs with arbitration disabled and none of the smartdv,* parameters vary
per board, I will drop this property (along with all other smartdv,*
properties) in v2.

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
> And why would that be board level configuration?
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
> > +
> > +  smartdv,arb-scl-delay:
>
> Except Conor's comments, some of the properties here should use proper
> units.

As replied to Conor, all smartdv,* parameters do not vary per board on
LGA. In v2 I will drop all smartdv,* properties and the generic
"smartdv,spmi" compatible, move the LGA controller configuration into
of_device_id match data keyed off "google,lga-spmi", rename the binding
to google,lga-spmi.yaml, and drop patch 1/3 (vendor-prefixes.yaml) since
no "smartdv" prefix remains in DT.

Thanks,
Vamshi Gajjela

