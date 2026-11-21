Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AA4606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 12:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ucPiAr2G;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F4ijtRmk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=; b=ucPiAr2GqTBQZk
	66J1a2el6F5qu8HL0WOCqQc1XPc7dnSY/ednl/NJT8oNoQJRYzt+ygA5F0LKwdfx7M1rHvs7bN8zr
	twxdM6Y+zNYV0oPNsuKrwGkzBkCuwHqAbPqM7X8J5PVa4frW/i50OzVYO5obaHKhsxFmnnbDh5nC8
	CcYjjhlXXy1QalyZfCN3uf9AF1vEmkngho2ojI3ODkXPH5D/8QX6pGn4psMKM2uN6xd08npQG3b0j
	KbjeeedsiAkmDsSn3Kebad/6K5D2hk89h5OFV3Q0txlhWu4CukIa9y4tig2qREhU649bMzxAqzbfR
	z1tKBi7sGNSiVOmBJfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjwM-0000000H91H-05gV;
	Sat, 21 Nov 2026 12:11:34 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjwJ-0000000H90y-0mqc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 12:11:32 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-67db5e13b0cso1631330d50.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 04:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795263090; cv=none;
        d=google.com; s=arc-20260327;
        b=kYPmzvIr6uDUaaYoIvMMfTNcA1b5f/26PU9wjuSeGhsG/4pfEiF74VIFPBQsDDeiwc
         kL+YTO9t0HjPwdSNfhMLq4qB+xUI2aJe+F9FCjCDFWscziQSYIjBLlAThOLjSRbeDdFW
         XiiLqwpUaqiry06fv/ZzbjItrbbJzOiUPnl+OZKxki4Z+lWzdJS2jrlomw8uR/EbI8DM
         YYAORN48uA0c5YCVMff39/G0VfqRpz1+ta3VdG+O8A++EccmID/wi0GrMdXKKG+xb5zS
         lQApFEzgBlvOOQDvi1ixnuJLG1RlNSdh086Efxz5I1LmPeio4Z4DwrcL1nndJMeayiqC
         d9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=;
        fh=nOSCr/dyz0gvjJvpjwmFgsAz0nTLxXs2hnC3kjKXt5I=;
        b=d6pPyEIM9CVCpy+xVwsf6WA7RVefRZt2Y3r9OmYmdwlcLovU0GIwMSsrKXhBxurKIk
         BHdVqjO7jFO2DkAYFOxPpPt2vaL8Q91NPyXqGr6VA+XlGZI0dV5U1PC6mUFqmpNoWUc8
         tktChutHzECIpqtdmBydDGCcvdUEA81fg4iGjc8qdHRE5H+jjZsC8NZC56NWfBhj1bN7
         hn4588jNmU3a6glivF1nU1ei8ji6nZp7z5zXJep311sJdSddpkApT0RZ5Rsuj2U3YMQK
         eDqrlArqX36jXC/AcGiIlqR3dHiW6ujxhXNses7eBxw0dPUJd6sclMPanK6qr8DazSb0
         cAJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795263090; x=1795867890; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=;
        b=F4ijtRmkF8WMp3m12bpgSoz7tBSSddCOrwXu3OsCiFQMNyUWNIq/18ye1xHR1M40rX
         vjLjkVX9A2+trJMslyrDNty6sFXt/gFiiK1BsWcY6Fq1ZQXdlRY6VCjNPti2H2R8FNVS
         FJJVlWA7QRLNwqoc4EoXd61Qt+uKG51xrGVzXcjbHAge0Ue2xQe4DEMklcWJ7na9CvcE
         +FfDE3aXdbkJBkeiK7IB6IqaIgwCm5Vu+fZEHXUp9jNB76mOj3NhVRopzJRu1tr5WlMb
         haOhelqjXvojXM0sN/HF4NoLqXAeFq5dsMIwgEn/VZn0zabAInlJu/O1O/LeHhs6/F5J
         Zz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795263090; x=1795867890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=;
        b=WSK4lRs4x5N/kpMfV2OkPctNEGTgPL/d6AYluDEO+hR+Nc4QtrGcAmLhQajVnP5Viq
         oFH3fs3nHj0NaxiQe+MPnVvy32d4L1alrWdQZyVQSn4ndvX+Tfu/1aCaiT5tXRFL7YKs
         06Wx4QXpKfMxCY8dom3hI5bWvPvEwP2A3KzsZ5JkxWMwzYEKgujw2m+WA1OaaJzm/o60
         LNOlLT8nXz0fu4qaI82/Jk1i8YOxnCnPfb42tnG2P77j97NTo1nQ3Vf+Ie97sBEuOP1x
         eSTwxXSZ8pYC4axyrvlbjysejqng8EhKVbPVkqbtGockApTwUHtqu4bs9G5L+y7j2sg/
         Ja+g==
X-Forwarded-Encrypted: i=1; AL+hErHTo/1poM3TCqFT7jRe+GGwzd/9QTyd5Yx1/2+PgXYzg5VCb0Tf4em2aJJ9rzyyjThqg7z7IYT2zoPTMCe+8BA2@lists.infradead.org
X-Gm-Message-State: APuU4Z8uiwWIHPhkGnh5i+x8qQwpYLZ0WeiiGFE6BrUBICujli1IUamT
	ErRTrpwodmwqMsqj0q248lAeZTMmtpfn6qVabE7cc9LEMgaSVo5dB6T7PNd2auqfl4VinCKugR/
	ADFVMPCwckUvgNQ68YD0za7J/DLNnvfVtFNRQ
X-Gm-Gg: AZFdTZcBlsvHZSQPvewLGs2onLDn9eMG/QNLKXsnRyz7BCplVw9yfXYO88HceXwepDk
	oobY2GzUOAYOVpqbRthEhLG/1CGF1zWKEMIleYEmANhVdfEqkkZCVzj62vYNLT4VmsTSSJqaB/2
	bswQrqpsdCvf6Ay09QSffzeSe91Qvw586JkuR7VuW1oeIUCjoSZ+qFaePbxYDWeazUeBVIi2Rr3
	q0dI2cWvGcPb8izF3kL6gxUOiO0McL1+p4nBeNxs4S5VthycPMhuIBYBR8621CmlBIFvTA/btLY
	3BkvStN5cP3lgMo2F7iN1zE8cmaQHUoPQ2+ycifQ4KyF2MTTEc89AjzgVu/RgEjb63S23WBIc9w
	Kq+O/7VonT1ZWyu8RPmOHcrTJq3FF+9j+m2/KRWB6MFkevn5J/jY1kHIhe47IGVYwH1+iR7mSI/
	S2gAWFBNfu84WGUTgr4h11sGepjg==
X-Received: by 2002:a05:690c:61c4:b0:8b3:5fd6:a544 with SMTP id
 00721157ae682-8b52047e1c1mr19674487b3.58.1795263089936; Sat, 21 Nov 2026
 04:11:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com>
 <20261121-m3-cpufreq-opp-v1-4-42a0c07c48a4@gmail.com> <CANpmGNvd3Bnv58BQX3UcX5eOip5Q0DfmPhvPp_9DGRQQUWOqQg@mail.gmail.com>
In-Reply-To: <CANpmGNvd3Bnv58BQX3UcX5eOip5Q0DfmPhvPp_9DGRQQUWOqQg@mail.gmail.com>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sat, 21 Nov 2026 23:11:18 +1100
X-Gm-Features: Aa3M54osrg6doytRUFLjK8s5YltogEr6ZngrwFO8UHAiCYiFQIm7-VCyERe-Cqo
Message-ID: <CANpmGNtfmk8QODQf9x7nkVSr8F+=8Hfh8GbKjCOnxvw3PXCTFw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: apple: t6031: Add CPU frequency scaling
 and OPPs
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yureka Lilian <yureka@cyberchaos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_041131_241075_6FEFBCDE 
X-CRM114-Status: UNSURE (   9.70  )
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

Hi,
On Sat, Nov 21, 2026 at 10:52=E2=80=AFPM Michael Reeves
<michael.reeves077@gmail.com> wrote:
> Oops, I accidentally forgot the capacity-dmips-mhz for these ones.
> It's just 1024 like all the others. Can you apply that when picking
> this up, or would you prefer I send v2?

To fix this and add proper T6032 die1 support (as suggested by Janne
in response to the cover) I will be sending a v2 shortly.

Thanks,
Michael

