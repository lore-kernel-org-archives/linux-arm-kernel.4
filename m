Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F1B606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 20:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GbOdElcD;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Rn+smbFE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=; b=GbOdElcD4x3FKZ
	2okQ36Z/lTGX7KmYg/NXkhN8Prz0VEZqkaDcjnrBYnEXX8RC6GUUB3udIg8HVWjPRUQ5gBL70LHjz
	HemsIx0nrXN54f+JtgYrNwkqVT1e1+lV+aIk2AdmDUENvXX8avjh0Ifc455w7M8XCLRB4euElcVsi
	GTO33jCqLuCW6L8Nap1rOOFfKoXSNN9DdXsx6miM+jAiH3Y3mMxAuEMJtf9GoEmkF2iiGROgKhX33
	xCNIra4J8/hHdhEGtwujdlJMn+owM8qnaAoVvAp/auFwz7wrj8755kDjVU2dpkPoxi/CGp/wfCwpU
	iWMFs4b1FnoQT/uK3k2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgwV-00000000Rjk-4BzZ;
	Sun, 15 Nov 2026 20:35:16 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgwT-00000000Rib-0MgH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 20:35:14 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-67da3d03263so724390d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 12:35:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794774912; cv=none;
        d=google.com; s=arc-20260327;
        b=LslmiXxQ4Uzqa8bXBLZArwUYDnbSf7JaKZroYb74Eoq+JVui8Ol1XESukgETIjy/B6
         Irk7HGqozvr5tLFZG2yRZ+X8QmkzvERAoliOaTJ01D1eZZ+xovbVQCn+5MLE2soGhQFd
         Vki4GBH1Ox4AyrX7Mf+8Vh69YobP2lIK4nX/q8kjjq4LUISnUGfkeILTUFwTr5qrRQoW
         Lh0Nmxb1j1HtWxnqMDZQrCOaA4dcAFlrbjn2E8zKjK5/XEq8jXHruce0FlckfIv5i4zM
         5v++KGZ61IYigS95eGtpKfqrPmoTQR33yiY2ZqbvINVmf308Flm7I580Q0Gb50Gq5Iag
         L1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
        fh=KVHLG3sB92H7x3belvKqjvg//22r3flhxUIMV+VG4Yo=;
        b=N3OPW0gWwu/0eeOq0/T1Vm/4UErGb5hGrDi61iiXY+RDuOc88KAGiQImOaQiwN2/yz
         jPu61qhdpw6mmOtqievntWefxq/+prVJGR+uazSdXPMKgdxe5SXleCjqjh9IHow7Q/KF
         CcHgzXXultUn76mVLHjhuwzdK+4K9ftI0TlwhUTX0RUaCDCUQajpCfCEzCiKRTLBQyeY
         A9OP+EyhpODOO0cMQjiVggLBnK+0+NHZHL3/oSLSx2SeDL8PmVVlgVFmM86OGlws43Ju
         vMsdC/5toB77brY/ACUM9SePl4K0CkyRZ7Liw7RNwXrHqghOSRq9hvHPROtzd5wzWWjM
         Z8aw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794774912; x=1795379712; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
        b=Rn+smbFE6aS/BsypiGIo6T47q1ic/NOAu89o9+7CGhTRD96Z61BFtbh9C0ntlGWzHl
         NniHMZOPmhFMPiMXwxN6v8SgcdVJlx3rU/RGJSw1JNiABRQ3ok92rW41Kc57wkizY7pJ
         cleZbFteY79nYgLKi1kb9yxmNTfVOYL7T6jUe7yHLfupPtYg6aMATzTHJI8IbV2SXX1Y
         QLZien2rvj+7AHUPOQWRgNXRF3NQ4en1A1jmndz8K84rpRGdlrKs3iaipoPLfbnYrdts
         2oLum2OMfaHSN+xIKRTxtvzJOcxYqSpCFP8nAiKP11fDS4N7/HETCOWcUbp+T79nXtOz
         0eEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794774912; x=1795379712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
        b=WUPtgv5qdJxjUtHmWo7GfBD5f5l/27bKfqQ3HFbPuss1bDilK0mZm3fHuoLeH7MoMb
         C08D3mnipil33xISfC/+YJV/cVXuNUHMIzMJ8/lPesli+0C8aqKPRyZaGYDzG1CmrkCz
         4/X1F5aAxHjn/no6RbbTEPOlnGWtJRwi8mMDPOKAPPaXPjVyLERnM0r03W938PiH/s9x
         sgYWai/653CEoW39V/aNmyTn54l33tNR9rFDsGub95iq5lnDmh1T5SgdH/a7TSfdSMUO
         bQkOIk+hB8HZv2JxKKAmIGzaQs0fKNgKS/YVjZp34WoVCC83srJsn5XzWkJfWyBe6Xs/
         IizA==
X-Forwarded-Encrypted: i=1; AL+hErEjwMRNsDMfkZFGwsCJJRe+mglypYLur47lAIGRCsCTF//fKt3XZ/FuYHYfufxJCaO4MTCe1oFNZs34kfWwIdb5@lists.infradead.org
X-Gm-Message-State: APuU4Z8Vgm9I4n88q6C3arsWwfvBJugKA8fdrIbfby5Bj8nEnf+Xitkg
	xvkK0AiDIbn3iupqggmndtEvKkUkthVMhQV5gEmwaTXwP0ScjCA0yq7VCpR819kXuAsO8LjfC0J
	GMZigMqs20K3B9QCCfLI/A4jY5b7qvJU=
X-Gm-Gg: AYBFou0D82J3gNawssikIOIik0WV5/+ld5Ji7g80dSoyQZ/RyR0VI3MpUe+QxxFpFdR
	Doj5EHBeATXv9Q4vq3ninlitDBxdjwxppvMu5irOCdjk/63lINq5faUh1mYPMJHukN+KKhYbqJJ
	K5Fxp95Cyw9cot6GlbMEa7U/yu83v+vSJJnUXW8MYqBRPmm1jtMxwB2Or0v8RuZSWBBsSUcZTL1
	KIUhGLpbWjTRtjD5GJvnUqzbuqZ3i2ast6c4v2yGRb0D3b1+9ddn6Fkrgyl5MFt7BMZSzRELPuz
	tQudsaWfqPkbP1jH4YmJ0r8wlbrFRyVcjfbfnalEbMkWXx1kbzrzeRkdwEhk9zJCzUCWd7vLYFa
	8R+toFNxqRAbtRDJ9YbXodWM5V8YB9dhTkp4o5p8IRJj/me5IOwN3HnWnw0zgrPBYLKci7A==
X-Received: by 2002:a05:690e:12cb:b0:67d:b94b:6021 with SMTP id
 956f58d0204a3-67db94b66dcmr213466d50.143.1794774911740; Sun, 15 Nov 2026
 12:35:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 21:35:01 +0100
X-Gm-Features: AclHuK-bZ0RnQfOiBUZa9VF3gQt02asaFssBFzc6vFvqnEmYWhTqvHFuHS-Culc
Message-ID: <CAFBinCDfE9J7fFnvJ2YqeFx1ZijY+5aFjGcpcBLMDrnpU8OipA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add S4 support
To: christian.koever-draxl@student.uibk.ac.at, krzk+dt@kernel.org
Cc: gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_123513_134253_3E974553 
X-CRM114-Status: GOOD (  11.15  )
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

On Fri, Nov 6, 2026 at 11:46=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The S4 USB glue is the G12A one, but it fronts an xHCI host controller
> instead of a DWC3 core, with two USB2 PHYs and no USB3 PHY. Add an S4
> compatible with the G12A one as fallback, and allow a generic xHCI
> child node.
Krzysztof, I have have a question regarding the last sentence:

[...]
>      oneOf:
>        - $ref: dwc2.yaml#
>        - $ref: snps,dwc3.yaml#
> +      - $ref: generic-xhci.yaml#
Does this mean we need to the allowed child-nodes to the compatible
string (so only S4 allows generic-xhci and G12A only allows dwc2/dwc3
but not generic-xhci)?

