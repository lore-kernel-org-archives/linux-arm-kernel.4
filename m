Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A07606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 02:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BD9ThpYr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ie/UskJA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-Type
	:References:In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Hx5DhP45Gc6LodtMts6vbsFotwIaFwhRMtG1SHCp+jI=; b=BD9ThpYrROr71ig/ZD1HqH0a1K
	Na+ldLKZ833x4SFZBvP4UXZYKX8zKnSHEmM6KC80w7cEjNxOKCXkcqOoCKhbf8oGUwm50hBlNzT5D
	UOdUjFHjniAxaTG9dOJSwQqKgm+QJJdSFsOOOTo6DbGAedzgSUjz3wKi2pQNZtcaT/Hx6ooY/MyI8
	ZraF0XKdvVHgX6ZImi8L52G1r6C0MLBBOFFCXMI5BDKvsPZFhL56JYro2WCWpTLioAiZjocxrvslU
	PbK224EjBYdpeWW5prcqMz63rdFcC9cV+rUL2Pv/NKiXlQehl4U9W9ydlXNOQ34WiQYxMiRG++SHm
	gB+E0fdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlcO-0000000Em3h-3NK3;
	Fri, 27 Nov 2026 02:23:20 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlcL-0000000Em2U-2Ekq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 02:23:19 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cd69954c755so5499897a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 18:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746196; x=1796350996; darn=lists.infradead.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hx5DhP45Gc6LodtMts6vbsFotwIaFwhRMtG1SHCp+jI=;
        b=Ie/UskJAdnxgvi7WGnIXBW6KI9OdDnDT9WUZCqzjMp4ENC/3FUQ3O+lgYmXFLPr4at
         guCEcuC1UNa0eEOFwNkKA/pZSl60iiaJCDax+PB5lDow4C+SMAddU6RBdGPCXwfT2nBW
         5DNb3K11uG4Tvt/A/eL6bdfJz8G2bwcG5UDECjG4hrJjl14GvcSysEeMW6GZafay/AMJ
         fhh+u+IUnD0Vz3rqd9aLmSZxQdmeET1Snhl+jyZlXF6t37wmIgN1XutQZi/00w7a0z2R
         4LWaHHUX/+qVjPXHJvJK9mgj2qlEqJ5LaQyx6EcdkiknvEBtyMdvNC8Y610+XCtznhOq
         qd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746196; x=1796350996;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hx5DhP45Gc6LodtMts6vbsFotwIaFwhRMtG1SHCp+jI=;
        b=tCrVpMfbRa11nRUZt4tfitOfiPkN6LF4TBZn4GVB55678Nom9Ug3o+0fhpAaWYCugW
         0QcOl58hGWnUlTxQTmqLLRMJ9Dj1tsOTLUY5UlZOnYUKkAQ4ELh0Nimucz3yW5WGGgwW
         TGcBJeK3Dbqq3ZJw0yXluixcvvJKAsWr0OOPHtampq6yPXnvDw/6LXpuw+nMyvG8p7iH
         hza2jzAFRRkT/r5qZXgvD5iSr6Aem29orygr2Q3GwXHQt2k8Oxh85KycPWaoERhdrFbX
         UXNBlfhoJZ+AZrayeB3WDclDV7FTfCGfYRYgAsAGNk5LDwCDacnTCgD0FTUbKzK40MlI
         x8UA==
X-Forwarded-Encrypted: i=1; AL+hErHkWHH9ekKH1M6f6GYLWvPFehMfEVYXOXqmqDw3ZL011BKrvQDLmHOu1ylODRbJ9VWBTyNMBm3dvqdBiTl5FZAw@lists.infradead.org
X-Gm-Message-State: APuU4Z9P1esHbbxcS8/T8SPf9xhnFVS86k6LBRRCjcCsZ6WmfGRCsHY+
	iOjtLO7pIoXaJvOuHhJRhezvt4miXqTP6MWEKDypqpNUEBDT8otmuKEr
X-Gm-Gg: AZFdTZfI0dpTuI40vPXsUHp6fKjX57SACUxTnHw6e3gzs7B1evTcRaNCmUzDeBHdCVY
	03CovhliKhzGmsofys94AxABIY56dLgs6RXhJWfoMKqDMkgQ/qEgPx4LwVeEObStHy+YJDLRfi5
	sBSTqJ5IR+DC2uF+Amm6zFTIrLxLMKE2nUVIMClGzXOpJFvsSGt7PB6o93ZwaAJhbeKgcy96sHX
	S6lE2lLJhl2Kz9azWTKHo7QpWTEVhUoJUH20hTUxr0g00AtN9hZ+7MzOYXvUnDg63DxaA7h41OO
	cCgT7ND2iib/VATFNsCb1caFWW7VK/VlipPVO62xTnizmdeiYhsytPHjcuqjyMU4Q+K0bU7ueKr
	u1Q9eBj60R16RbdXPRzI3IWYO/WDxY0vvNSp/NBy6wMSKGrIksoTY1UQIYTsVl71OKy7RhfkIXH
	QI6avl/wqRhzFlK07p3rjfZcuwjxPxlxGIjRNPRpp+SBG58oX/gw3Dd5D5Yd8dltD7/TplcIzMZ
	Za6PgKiti1IJcm9RpRUuTU3/G8ecXrDNgDlYiMW19ZL403MiQYZj9Cx2u1DJ4qwe+lB7xFSosFb
	Ff+eLuzzeoUDfrMxXfD9qWnD0s1yxWk+75UpJBG7goPd6m3brg+R9s4115JGrJZvKlsE8K+6JL0
	=
X-Received: by 2002:a05:6a20:c992:b0:3e2:3c7:7754 with SMTP id adf61e73a8af0-4014d25482emr23831723637.65.1795746196540;
        Thu, 26 Nov 2026 18:23:16 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdea2aed207sm5635547a12.11.2026.11.26.18.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:23:14 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-iio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: mt6359: fix MT6357 ISENSE/VCDT and
 MT6358 VCDT request bits
In-Reply-To: <r7Vh1EmPu-wr1NpHp23HZp7Fa0qmIAj6FTo_g8upWCKPJmnTk4kpjHxcDEjYankGVSc7WkkdWEklsFFUDQBF_XRB3GMM2XauzSsdw39czF0=@protonmail.com>
References: <20261126031013.27701-1-iasnezhkov@gmail.com>
 <20261126031013.27701-3-iasnezhkov@gmail.com> <r7Vh1EmPu-wr1NpHp23HZp7Fa0qmIAj6FTo_g8upWCKPJmnTk4kpjHxcDEjYankGVSc7WkkdWEklsFFUDQBF_XRB3GMM2XauzSsdw39czF0=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 10:23:09 +0800
Message-ID: <179574618985.4164.4856012256948069545@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_182317_571367_CD01CBDF 
X-CRM114-Status: UNSURE (   5.44  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.2 (+)
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
X-Archived-By: <archiver.kernel.org>

Hi Roman,

Thank you for testing and reviewing on MT6358! I will carry both tags
in v3.

Best regards,
Ilia

