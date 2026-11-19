Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B43606E4F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zy/UPxX3;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=dN/n0NZb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Sb5ECHJq075NdZLr/aOmkhX0xJSaoLaGufS+947cOIU=; b=Zy/UPxX33axgCw
	MkVUnAQIsFcONgFizsvACtqvhq1hLDYZKOxlv5wroRjhax+b6zs8jCB5HTOWBioSQ0664Tnsqbr5u
	hkxJX3XwryI1NEpGQ2a7DqHhu8fXxo61KrN+4bxJohIRd3MeHgmgfI04o2yhtV3pywwF6dJ/sD2ln
	f4GDmNEdHzu0eF4DD8q01+wCHiJhssSt7MFMReor5dsBxaD2sm646uDSJII4TyvF+IfIgUTDDqxUy
	MI6Um8EXUY96HjrPEASoSbn07+Jv10s3CZ1F1G3Gj7urFmmOrlbzWOmjiCp0zr/8WBteqvWvFYOeE
	1t3SPhBtBGJ7wOTWJodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8fL-0000000DM7V-03KF;
	Thu, 19 Nov 2026 20:23:31 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8er-0000000DLmU-0MIn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 20:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=Sb5ECHJq075NdZLr/aOmkhX0xJSaoLaGufS+947cOIU=; t=1795119781; x=2110479781; 
	b=dN/n0NZbCVSo8BQmiu3nIVfnJ+hoaTkfm9nEHVn6OFsIB67diq5BQar1+wPbEdF8ItktZe5wvW7
	GiLyDZD0lppQN+G+IKx8G49Gse42zJC5mU80+Lyp9rXdbEU9YxYFq3uLZJqXPB5r2MDjyqrXp99Ep
	R8ZWfK6ZVJW0aWZHCE9z0ZfgWuGbC6fjOh1YHgeyvSIEYSzj8l/8pirXAw4y5pA7jKvQD+c3+Uu6F
	iZ3VEUMHjYl4gz1smDTd5LrPQh+EY1PT519fbRWtNE4SsLHRbpsMrv7uAgE3zPXOV5qJczgzjY6zO
	4+GIjfbSmVl8132TEO7KRt8i6+fORgfEW9PA==;
Received: from [177.172.124.218] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xU8em-00000001cIK-1kER;
	Thu, 19 Nov 2026 21:22:56 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 19 Nov 2026 17:22:05 -0300
Subject: [PATCH v10 15/16] perf: Add an option for common table for
 build_tables()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-tonyk-syscall_table-v10-15-a7c9ebd900f6@igalia.com>
References: <20261119-tonyk-syscall_table-v10-0-a7c9ebd900f6@igalia.com>
In-Reply-To: <20261119-tonyk-syscall_table-v10-0-a7c9ebd900f6@igalia.com>
To: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 linux-perf-users@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
 Magnus Lindholm <linmag7@gmail.com>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_122301_168280_7C83D3BD 
X-CRM114-Status: GOOD (  12.75  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

build_tables() parses the syscall table files for perf. Add an argument for
concating a common table to the local arch table. This is useful for
architectures that have moved to the new common syscall table.

While here, add an extra +[[:space:]] for the ABIs parsing to ensure that
it doesn't match substrings.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 tools/perf/trace/beauty/syscalltbl.sh | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/perf/trace/beauty/syscalltbl.sh b/tools/perf/trace/beauty/syscalltbl.sh
index e70a8c79e019..adc29af6e891 100755
--- a/tools/perf/trace/beauty/syscalltbl.sh
+++ b/tools/perf/trace/beauty/syscalltbl.sh
@@ -36,14 +36,24 @@ build_tables() {
 	outfile="$2"
 	abis=$(echo "($3)" | tr ',' '|')
 	e_machine="$4"
+	common_tbl="$5"
 
 	if [ ! -f "$infile" ]
 	then
 		echo "Missing file $infile"
 		exit 1
 	fi
+
+	# if there's a common syscall table, join to the arch table
+	if [ -f "$common_tbl" ]
+	then
+		aux_file=$(mktemp /tmp/syscalltbl.XXXXXX)
+		cat "$common_tbl" "$infile" > "$aux_file"
+		infile="$aux_file"
+	fi
+
 	sorted_table=$(mktemp /tmp/syscalltbl.XXXXXX)
-	grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | sort -n > "$sorted_table"
+	grep -E "^[0-9]+[[:space:]]+$abis+[[:space:]]" "$infile" | sort -n > "$sorted_table"
 
 	echo "static const char *const syscall_num_to_name_${e_machine}[] = {" >> "$outfile"
 	# the params are: nr abi name entry compat
@@ -60,13 +70,15 @@ build_tables() {
 	# those without. This default behavior of sort differs from that of
 	# strcmp used at runtime. Use sed to strip the trailing 0s suffix
 	# afterwards.
-	grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | awk '{printf $3; for (i = length($3); i < 20; i++) { printf "0"; }; print " " $1}'| sort | sed 's/\([a-zA-Z1-9]\+\)0\+ \([0-9]\+\)/\1 \2/' > "$sorted_table"
+	grep -E "^[0-9]+[[:space:]]+$abis+[[:space:]]" "$infile" | awk '{printf $3; for (i = length($3); i < 20; i++) { printf "0"; }; print " " $1}'| sort | sed 's/\([a-zA-Z1-9]\+\)0\+ \([0-9]\+\)/\1 \2/' > "$sorted_table"
 	while read -r name nr; do
 		echo "	$nr,	/* $name */" >> "$outfile"
 	done < "$sorted_table"
 	echo "};" >> "$outfile"
 
 	rm -f "$sorted_table"
+
+	rm -f "$aux_file"
 }
 
 rm -f "$outfile"

-- 
2.56.1


